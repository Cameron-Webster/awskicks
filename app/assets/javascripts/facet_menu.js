$(document).ready(function() {

  var width_menu = window.getComputedStyle(document.getElementById("facet_menu")).width;


$('ul.dropdown-menu').css('width', width_menu);

// stops dropdown menu closing too quickly

$('.dropdown-menu').click(function(e) {
    e.stopPropagation();
});

})
