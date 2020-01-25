---
layout: page
title: Personal
permalink: /om/personal/  
---

{%- for employee in site.data.employees %}
<div class="employee">
<img src="/img/{{ employee.photo }}.jpg" class="employee-photo" alt="{{ employee.name }}"/>
<span class="name">{{ employee.name }}</span><br>
<span class="title">{{ employee.title }}</span><br>

<p class="bio">{{ employee.bio }}</p>
</div>
{% endfor %}
