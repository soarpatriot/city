$(window).bind 'page:change', ->

    $container = $('#information-container')
    if  $container
      $container.imagesLoaded( ->
          $container.masonry({
              itemSelector: '.item'
          })
      )