{% assign current_year = 'now' | date: '%Y' %}

<div class="calendar-container">
  {% for month in (1..12) %}
    <!-- Month prep -->
    {% assign month_str = month | prepend: '0' | slice: -2, 2 %}
    {% assign month_start_date = current_year | append: '-' | append: month_str | append: '-01' %}
    {% assign month_start_timestamp = month_start_date | date: "%s" %}
    {% assign first_day_found = false %}

    <div class="calendar-month">
      <h2>{{ month_start_date | date: "%B" }}</h2>
      <div class="calendar-grid">
          <b>Mo</b><b>Tu</b><b>We</b><b>Th</b><b>Fr</b><b>Sa</b><b>Su</b>
          <!-- First day finder, for correct formatting -->
          <!-- Adapted from: https://mikhail-yudin.ru/blog/frontend/jekyll-calendar-css-grid -->
          {%- for i in (-7..30) %}
            {%- assign day_timestamp = 86400 | times: i | plus: month_start_timestamp %}
            {%- assign day_of_week = day_timestamp | date: '%u' %}
            {%- assign month_number = day_timestamp | date: '%m' %}
            {%- assign formatted_day = day_timestamp | date: "%m-%d" %}
            {%- unless first_day_found %}
              {%- if day_of_week == '1' %}
                {% assign first_day_found = true %}
              {% else %}
                {%- continue %}
              {% endif %}
            {%- endunless %}

            {%- if month_str == month_number %}
              {%- assign events = "" %}
              {%- for post in site.posts %}
                {%- for event in post.dates %}
                  {% assign event_date = event.date | date: "%m-%d" %}
                  {%- if event_date == formatted_day %}
                    {%- assign event_year = event.date | date: "%Y" %}
                    {%- assign years_ago = current_year | minus: event_year %}
                    {%- if years_ago == 0 %}
                      {%- assign years_ago_text = "<b>This year:</b> " %}
                    {%- else %}
                      {%- assign years_ago_text = "<b>" | append: years_ago | append: " years ago:</b> " %}
                    {%- endif %}
                    {%- assign events = events | append: years_ago_text | append: event.title | append: " <i>(in <a href='" | append: post.url | append: "'>" | append: post.title | append: "</a>)</i><br>" %}
                  {%- endif %}
                {%- endfor %}
              {%- endfor %}

              {% if events != "" %}
                <span class="calendar-event" data-events="{{ events }}">{{ day_timestamp | date: '%e' }}</span>
              {% else %}
                <span>{{ day_timestamp | date: '%e' }}</span>
              {% endif %}
            {%- else %}<span></span>{% endif %}
          {%- endfor %}

        </div>
      </div>

{% endfor %}

</div>

<dialog id="eventDialog">
  <p id="eventContent"></p>
  <form method="dialog">
    <button autofocus>Close</button>
  </form>
</dialog>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const eventDays = document.querySelectorAll('.calendar-event');
    const dialog = document.getElementById('eventDialog');
    const eventContent = document.getElementById('eventContent');

    eventDays.forEach(day => {
      day.addEventListener('click', function() {
        eventContent.innerHTML = '<h3>On this day:</h3>' + this.getAttribute('data-events');
        dialog.showModal();
      });
    });
});
</script>
