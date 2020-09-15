---
layout: default
---
<ul>
{% for page in site.pages %}
  <li><a href="{{ page.url | absolute_url }}">{{ page.title }}</a></li>
{% endfor %}
<ul>
