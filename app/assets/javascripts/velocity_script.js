$(document).ready(function(){

$('.show-left-drawer').click(function() {

    $('.left-drawer')
      .velocity({ translateX: ['0%', '100%'] });

});
$('.close-left-drawer').click(function() {
    $('.left-drawer')
      .velocity({ translateX: '-100%' })
    $('.content')
      .velocity(
          {
                scaleX: 1, scaleY: 1, translateX: '0%', opacity: 1
            }, 500, 'easeInOutQuart'
    )

})

});
