---
title: Search
permalink: /search/
layout: page
---

<!-- general page style -->
<style type="text/css" media="screen">
  .container {
    margin: 10px auto;
    max-width: 600px;
  }
  input {
    font-size: 30px;
    display: block;
    margin: auto;
    width: 400px
  }
  h1 {
    margin: 30px 0;
    font-size: 4em;
    line-height: 1;
    letter-spacing: -1px;
    text-align: center;
  }
</style>

<!-- search style -->
<style>
    #lunrsearchresults {padding-top: 0.2rem;}
    .lunrsearchresult {
        list-style-type: none;
        padding-bottom: 1rem;
    }
    .lunrsearchresult .title {color: #2a7ae2;}
    .lunrsearchresult .meta {color: silver;}
    .lunrsearchresult a {display: block; color: black;}
    .lunrsearchresult a:hover, .lunrsearchresult a:focus {text-decoration: none;}
    .lunrsearchresult a:hover .title {text-decoration: underline;}
</style>

<!-- HTML search field -->
<form id="searchform">
  <p><input type="text" id="search-input" class="form-control" name="q" maxlength="255" value="" autofocus /></p>
</form>
  <div id="lunrsearchresults"><ul></ul></div>

<!-- Grab search-script.js -->
<script src="https://unpkg.com/simple-jekyll-search@latest/dest/simple-jekyll-search.min.js" type="text/javascript"></script>

<!-- Configuration -->
<script>
var sjs = SimpleJekyllSearch({
  searchInput: document.getElementById('searchform'),
  resultsContainer: document.getElementById('lunrsearchresults'),
  json: '/assets/js/posts.json',
  searchResultTemplate: "<li class='lunrsearchresult'><a href='{url}'>" +
    "<span class='title'>{title}</span><br />" + 
    "<span class='meta'>{date} - {tags}</span><br />" +
    "<span class='body'>{excerpt}</span></a></li>"
})

    window.addEventListener('load', function() {
        var searchParam = new URLSearchParams(window.location.search).get("q")
        if (searchParam != null) {
            document.getElementById('search-input').value = searchParam
            sjs.search(searchParam)
        } 
    
          document.getElementById('search-input').placeholder = "Type your search here..."
    }, false);
</script>
