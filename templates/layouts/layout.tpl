<html>
<head>
<title>{{ title }}</title>
{% include "favicon.tpl" %}
{% include "head-links.tpl" %}

</head>

<body>
  <div id="page">
    <div id="wrapper">
      {% include "sidebar.tpl" %}
    
      <div id="content">
        {% block content %}{% endblock %}
      </div>
    </div>
  </div>
</body>
</html>