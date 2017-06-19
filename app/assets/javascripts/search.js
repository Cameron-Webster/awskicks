$(document).ready(function() {
  count = 0;
console.log("we are transmitting");
$('#srch').keyup(function(e){
  count += 1;
  if (count > 2) {
  var v = $('#srch').val();
  console.log(v);
  $('#srch').parent('form').submit();
}
})

$(".mod2").on('click',function(){
  var sneak = $(this).data('rails');
  $.ajax({
    type: "GET",
    url: "/modal/" + sneak,
    success: function(data){
      console.log(data);
    }
  })
})
});
