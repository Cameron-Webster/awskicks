
$(document).ready(function(){



         var max_pages = parseInt($(".pagination a:nth-last-child(2)").text());

         $('.grid').on( 'request.infiniteScroll', function( event, response, path ) {
          console.log("infinite scroll requested");
            var pageNo = $('.grid').data('infiniteScroll').pageIndex;
              if (!max_pages || pageNo >= max_pages){
                console.log("should be off");
                   $(".grid").infiniteScroll('destroy');
                   $(".grid").data('infinitescroll', null);
                   $(".page-load-status").css("display", "none");
                   $("#fin").css("display", "block");
              }
         });



  var $grid = $('.grid').masonry({
    itemSelector: '.grid-item',
    columnWidth: '.grid-item',
    percentPosition: true,
    gutter: 10,
    fitWidth: true
  });

  $grid.imagesLoaded().progress( function() {
    $grid.masonry('layout');
  });

  var msnry = $grid.data('masonry');

  if ($('.pagination .next_page')[0]) {

  var $cont = $grid.infiniteScroll({
    path: '.pagination .next_page',
    append: '.grid-item',
    outlayer: msnry,
    history: false,
    status: ".page-load-status",
    checkLastPage: ".next_page",
    debug: true,
    hideNav: '.pagination'

  });

}

  $(document).on("submit", '.search_bar form', function() { //ajax enabled form

     // path: '/?brand=&gender=female&lowest_price=&page={{#}}&search=&utf8=%E2%9C%95'


      $(".page-load-status").css("display", "block");

    $(".grid").masonry('destroy');
    $(".grid").infiniteScroll('destroy');
    $(".grid").data('infinitescroll', null);

    $( document ).ajaxComplete(function() { //products reloaded

      $(".page-load-status").css("display", "none");
      $("#fin").css("display", "block");

       var max_pages = parseInt($(".pagination a:nth-last-child(2)").text());

         $('.grid').on( 'request.infiniteScroll', function( event, response, path ) {
            var pageNo = $('.grid').data('infiniteScroll').pageIndex;
              if (!max_pages || pageNo >= max_pages){

                   $(".grid").infiniteScroll('destroy');
                   $(".grid").data('infinitescroll', null);
                   $(".page-load-status").css("display", "none");
                   $("#fin").css("display", "block");
              }
         });


      //get form values

      var gender = $('input#generoo').val();
      var brand = $('input#brandoo').val();
      var price = $('input#priceoo').val();
      var search = $('input#srch').val();


      var request_path = '/?brand='+brand+'&gender='+gender+'&lowest_price='+price+'&page={{#}}'+'&search='+search+'&utf8=%E2%9C%95'



      var $grid2 = $('.grid').masonry({
        itemSelector: '.grid-item',
        columnWidth: '.grid-item',
        percentPosition: true,
        gutter: 10,
        fitWidth: true
      });

      $grid2.imagesLoaded().progress( function() {
        $grid2.masonry('layout');
      });

      var msnry = $grid2.data('masonry');

        if ($('.pagination .next_page')[0]) { //need to check this does work

      $(".grid").infiniteScroll({
        path: request_path,
        append: '.grid-item',
        outlayer: msnry,
        history: false,
        status: ".page-load-status",
        checkLastPage: ".next_page",
        debug: true,
        hideNav: '.pagination'

      });

    }

    // V calling twice prevents resize grid error (ajax)

      $(window).resize(function () {
      msnry.layout();
      msnry.layout();
      });

    })

  })

  //non - ajax

  $(window).resize(function () {
      msnry.layout();
      msnry.layout();
});

})




