{% extends "layout.tpl" %}


{% block content %}
<main id="main">
    <article>
    <a class="post-thumbnail" href="http://nordthemes.com/iceberg/five-tips-how-to-be-creative-and-productive/"></a>
    <img src="images/sample.png" class="article-image" alt="Five Tips How to Be Creative and Productive">
    </a>
    <div class="article-content">
        <header class="article-header">
        <!-- <div class="cat-links"><a href="http://nordthemes.com/iceberg/category/travel/" class="category-1">Travel</a></div> -->
        <h2 class="article-title enriqueta"><a href="#" rel="bookmark">{{ title }}</a></h2>
        <div class="article-meta">
            <span class="posted-on">Posted on <span class="entry-date">{{ date }}</span></span>
        </header>

        <div class="entry-content">
            {{ content }}
            <p class="entry-more"><a class="more-link" href="http://nordthemes.com/iceberg/five-tips-how-to-be-creative-and-productive/">Read
                More <i class="fa fa-angle-right"></i></a></p>
        </div>
    </div>
    </article>

    <nav id="page-navigation">

    <a href="#" class="page-link">1</a>
    <a href="#" class="page-link">2</a>
    <a href="#" class="page-link">3</a>

    </nav>
</main>
{% endblock %}