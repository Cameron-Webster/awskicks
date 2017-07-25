
$(document).ready(function(){

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

  var $cont = $grid.infiniteScroll({
    path: '.pagination .next_page',
    append: '.grid-item',
    outlayer: msnry,
    history: false,
    status: ".page-load-status",
    debug: true

  });

  $(document).on("submit", '.search_bar form', function() { //ajax enabled form

     // path: '/?brand=&gender=female&lowest_price=&page={{#}}&search=&utf8=%E2%9C%95'

    $(".grid").masonry('destroy');
    $(".grid").infiniteScroll('destroy');
    $(".grid").data('infinitescroll', null);

    $( document ).ajaxComplete(function() {

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

      $(".grid").infiniteScroll({
        path: request_path,
        append: '.grid-item',
        outlayer: msnry,
        history: false,
        status: ".page-load-status",
        debug: true

      });

    })

  })

})



// var grid = document.querySelector('.grid');

// var msnry = new Masonry( grid, {
//   itemSelector: '.grid-item',
//   columnWidth: '.grid-item',
//   percentPosition: true,
//   gutter: 10,
//   fitWidth: true
// });

// imagesLoaded( grid ).on( 'progress', function() {
//   // layout Masonry after each image loads
//   msnry.layout();
// });



// var infScroll = new InfiniteScroll( grid, {
//   // options
//   path: '.pagination .next_page',
//   append: '.grid-item',
//   outlayer: msnry,
//   history: false,
//   status: ".page-load-status",
//   debug: true

// });


// $(window).resize(function () {
//       msnry.layout();
//       msnry.layout();
// });


// // after search results returned

// $( document ).ajaxComplete(function() {


// // infScroll.destroy();
// // infScroll.data('infinitescroll', null);

// console.log("previous infinite scroll " +  infScroll);


// var infScroll = InfiniteScroll.data( ".grid" );

// console.log("this infinite scroll" + infScroll);

// var grad = document.querySelector('.grid');

// var msnry = new Masonry( grad, {
//   itemSelector: '.grid-item',
//   columnWidth: '.grid-item',
//   percentPosition: true,
//   gutter: 10,
//   fitWidth: true
// });

// // grid.masonry('reload');

// imagesLoaded( grad ).on( 'progress', function() {
//   // layout Masonry after each image loads
//   msnry.layout();
// });

// var infScroll2 = new InfiniteScroll( grad, {
//   // options
//   path: '.pagination .next_page',
//   append: '.grid-item',
//   outlayer: msnry,
//   history: false,
//   status: ".page-load-status",
//   debug: true

// });


// });



