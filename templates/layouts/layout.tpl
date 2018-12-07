<html>
<head>
<title>{% block page_title %}{% endblock %}</title>

<link rel="stylesheet" href="/styles/default.css">
<link rel="stylesheet" href="/styles/monokai.css">
<script src="/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>

</head>

<body>
    {% block content %}{% endblock %}
</body>
</html>