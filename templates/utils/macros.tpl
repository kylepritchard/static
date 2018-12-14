{# Macro to return an HTML img tag #}
{% macro renderImage(filename, class) %}
    <img src="images/{{ filename }}}" class="{{class}}">
{% endmacro %}

{% macro epoch_time(time) %}
    "#{Time.unix(time.to_i).to_s("%-d %m %Y")}"
{% endmacro %}

