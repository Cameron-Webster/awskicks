$(document).ready(function() {

  if (document.getElementById("facet_menu")){

  var width_menu = window.getComputedStyle(document.getElementById("facet_menu")).width;
} else {
  width_menu = 0;
}

$('ul.dropdown-menu').css('width', width_menu);

// stops dropdown menu closing too quickly

$('.dropdown-menu').click(function(e) {
    e.stopPropagation();
});

})
