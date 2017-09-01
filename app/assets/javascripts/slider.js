$(document).ready(function(){
     var min_p = 10;
     var max_p = 200;

$( "#slider-range" ).slider({

      range: true,
      min: min_p,
      max: max_p,
      step: 10,
      values: [ min_p, max_p ],
      slide: function( event, ui ) {

        $( "#amount" ).val( "£" + ui.values[ 0 ] + " - £" + ui.values[ 1 ] );

         $('#priceoo').val(ui.values[ 0 ] + '-' + ui.values[ 1 ]);


      }
    });
    $( "#amount" ).val( "£" + $( "#slider-range" ).slider( "values", 0 ) +
      " - £" + $( "#slider-range" ).slider( "values", 1 ) );

$(document).on('click', "ul.dropdown-menu.price_drop_down input[type='button']", function(){
$('#stubby').parent('form').submit();
});

});
