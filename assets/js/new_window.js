window.onload = function() {
    var links = document.links;
    for(var i = 0; i < links.length; i++) {
      if (links[i].hostname != window.location.hostname || links[i].href.includes("/images/")) {
        links[i].target = '_blank';
      } 
    }
};