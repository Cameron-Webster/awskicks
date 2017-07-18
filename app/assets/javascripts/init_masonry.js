


var grid = document.querySelector('.grid');

var msnry = new Masonry( grid, {
  itemSelector: '.grid-item',
  columnWidth: '.grid-item',
  percentPosition: true,
  gutter: 10,
  fitWidth: true
});

imagesLoaded( grid ).on( 'progress', function() {
  // layout Masonry after each image loads
  msnry.layout();
});



var infScroll = new InfiniteScroll( grid, {
  // options
  path: '.pagination .next_page',
  append: '.grid-item',
  outlayer: msnry,
  history: false,

});


$(window).resize(function () {
      msnry.layout();
      msnry.layout();
});


//for hovering over pin

