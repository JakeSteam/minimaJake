---
layout: default
title: Calendar
---

{% assign current_year = 'now' | date: '%Y' %}

{% for month in (1..12) %}
{% assign month_str = month | prepend: '0' | slice: -2, 2 %}
{% assign month_starts = current_year | append: '-' | append: month_str | append: '-01' %}
{% assign month_starts_ts = month_starts | date: "%s" %}
{% assign fd = false %}

  <h2>{{ month_starts | date: "%B" }}</h2>

  <div class="calendar">
    <b>Mo</b><b>Tu</b><b>We</b><b>Th</b><b>Fr</b>
    <b class="calendar__we">Sa</b>
    <b class="calendar__we">Su</b>
    {%- for i in (-7..37) %}
      {%- assign day = 86400 | times: i | plus: month_starts_ts %}
      {%- assign dow = day | date: '%u' %}
      {%- assign m = day | date: '%m' %}
      {%- assign dayf = day | date: "%Y-%m-%d" %}
      {%- unless fd %}
        {%- if dow == '7' %}{% assign fd = true %}{% endif %}
        {%- continue %}
      {%- endunless %}

      {%- if month_str == m %}
        {%- assign has_posts = '' %}
        {%- for post in site.posts %}
          {%- assign d = post.date | date: "%Y-%m-%d" %}
          {%- if d == dayf %}{% assign has_posts = 'calendar__ext' %}{% break %}{% endif %}
        {%- endfor %}
        {%- case dow %}
          {%- when '6' %}<span class="calendar__we {{ has_posts }} ">
          {%- when '7' %}<span class="calendar__we {{ has_posts }}">
          {%- else %}<span class="{{ has_posts }}">
        {%- endcase %}{{ day | date: '%e' }}</span>
      {%- else %}<span></span>{% endif %}
    {%- endfor %}

  </div>
{% endfor %}

<style>
  .calendar {
  display: grid;
  grid-template-columns: repeat(7, 2rem);
  line-height: 2rem;
  text-align: center;
}
.calendar__we {
  color: #e22;
}
.calendar__ext {
  font-style: normal;
  position: relative;
  &:after{
    content: '•';
    position: absolute;
    top: -.45em;
    right: .125em;
  }
}
</style>

<!-- https://mikhail-yudin.ru/blog/frontend/jekyll-calendar-css-grid -->
