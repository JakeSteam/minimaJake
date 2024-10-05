---
layout: default
title: Calendar
---

{% assign current_year = 'now' | date: '%Y' %}

<div class="calendar-container">
  {% for month in (1..12) %}
    {% assign month_str = month | prepend: '0' | slice: -2, 2 %}
    {% assign month_start_date = current_year | append: '-' | append: month_str | append: '-01' %}
    {% assign month_start_timestamp = month_start_date | date: "%s" %}
    {% assign first_day_found = false %}

    <div class="calendar-month">
      <h2>{{ month_start_date | date: "%B" }}</h2>

      <div class="calendar-grid">
        <b>Mo</b><b>Tu</b><b>We</b><b>Th</b><b>Fr</b>
        <b class="calendar-weekend">Sa</b>
        <b class="calendar-weekend">Su</b>
        {%- for i in (-7..37) %}
          {%- assign day_timestamp = 86400 | times: i | plus: month_start_timestamp %}
          {%- assign day_of_week = day_timestamp | date: '%u' %}
          {%- assign month_number = day_timestamp | date: '%m' %}
          {%- assign formatted_day = day_timestamp | date: "%m-%d" %}
          {%- unless first_day_found %}
            {%- if day_of_week == '7' %}{% assign first_day_found = true %}{% endif %}
            {%- continue %}
          {%- endunless %}

          {%- if month_str == month_number %}
            {%- assign has_posts = '' %}
            {%- for post in site.posts %}
              {%- for event in post.dates %}
                {%- assign event_date = event.date | date: "%m-%d" %}
                {%- if event_date == formatted_day %}
                  {%- assign has_posts = 'calendar-event' %}
                  {%- break %}
                {%- endif %}
              {%- endfor %}
              {%- if has_posts != '' %}{% break %}{% endif %}
            {%- endfor %}
            {%- case day_of_week %}
              {%- when '6' %}<span class="calendar-weekend {{ has_posts }}">
              {%- when '7' %}<span class="calendar-weekend {{ has_posts }}">
              {%- else %}<span class="{{ has_posts }}">
            {%- endcase %}{{ day_timestamp | date: '%e' }}</span>
          {%- else %}<span></span>{% endif %}
        {%- endfor %}
      </div>
    </div>

{% endfor %}

</div>

<style>
  .calendar-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1rem;
  }
  .calendar-month {
    border: 1px solid #ccc;
    padding: 1rem;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    align-items: center; 
    justify-content: flex-start; 
  }
  .calendar-grid {
    display: grid;
    grid-template-columns: repeat(7, 2rem);
    line-height: 1.5rem;
    text-align: center;
  }
  .calendar-weekend {
    color: #e22;
  }
  .calendar-event {
    font-weight: bold;
  }
</style>

<!-- https://mikhail-yudin.ru/blog/frontend/jekyll-calendar-css-grid -->
