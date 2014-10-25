$(window).bind 'page:change', ->
   $("#shop_url").keyup ->
       url = location.protocol+"//" + location.host + "/shops/" + $(this).val()
       $("#shop-url-show").text(url)