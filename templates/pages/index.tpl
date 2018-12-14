{% extends "layout.tpl" %}

{% block content %}
<main id="main">
    {% for post in posts %}

        <article class="index">
            <a class="index-post-thumbnail" href="../{{ post.url }}"></a>
            {% if post.image %}
            <img src="images/{{ post.image }}" class="article-image">
            {% else %}
            <img src="images/placeholder.jpg" class="article-image">
            {% endif %}
            </a>
            <div class="article-content">
                <header class="article-header">
                <!-- <div class="cat-links"><a href="http://nordthemes.com/iceberg/category/travel/" class="category-1">Travel</a></div> -->
                <h2 class="article-title enriqueta"><a href="{{ post.url }}" rel="bookmark">{{ post.title }}</a></h2>
                <div class="article-meta">
                    <span class="posted-on">Posted on <span class="entry-date">{{post.date}}</span></span>
                </header>

                <!-- <div class="entry-content">
                    {{ post.content }}
                    <p class="entry-more"><a class="more-link" href="http://nordthemes.com/iceberg/five-tips-how-to-be-creative-and-productive/">Read
                        More <i class="fa fa-angle-right"></i></a></p>
                </div> -->
            </div>
        </article>

    {% endfor %}

    <nav id="page-navigation">

    <a href="#" class="page-link">1</a>
    <a href="#" class="page-link">2</a>
    <a href="#" class="page-link">3</a>

    </nav>
</main>
{% endblock %}