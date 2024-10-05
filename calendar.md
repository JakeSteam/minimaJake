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
        <b>Mo</b><b>Tu</b><b>We</b><b>Th</b><b>Fr</b><b>Sa</b><b>Su</b>
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
            {%- assign has_event = false %}
            {%- for post in site.posts %}
              {%- for event in post.dates %}
                {%- assign event_date = event.date | date: "%m-%d" %}
                {%- if event_date == formatted_day %}
                  {%- assign has_event = true %}
                  {%- break %}
                {%- endif %}
              {%- endfor %}
              {%- if has_event %}{% break %}{% endif %}
            {%- endfor %}
            {%- case day_of_week %}
              {%- when '6' %}<span class="calendar-weekend {% if has_event %}calendar-event{% endif %}">
              {%- when '7' %}<span class="calendar-weekend {% if has_event %}calendar-event{% endif %}">
              {%- else %}<span class="{% if has_event %}calendar-event{% endif %}">
            {%- endcase %}{{ day_timestamp | date: '%e' }}</span>
          {%- else %}<span></span>{% endif %}
        {%- endfor %}
      </div>
    </div>

{% endfor %}

</div>

## Todo

- Ensure text / border colour is CSS-controlled for light theme
- Display tooltip showing all matching posts
- Calculate years since
- Precalculate results (like search) instead of on demand
- Make config controlled, e.g. "custom-date" or "publish-date"

## Resources

- https://mikhail-yudin.ru/blog/frontend/jekyll-calendar-css-grid
