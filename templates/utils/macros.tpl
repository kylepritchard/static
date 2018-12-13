{# Macro to return an HTML img tag #}
{% macro renderImage(filename, class) %}
    <img src="images/{{ filename }}}" class="{{class}}">
{% endmacro %}

