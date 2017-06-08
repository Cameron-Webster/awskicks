$(document).ready(function() {
console.log("we are transmitting");
$('#srch').keyup(function(e){
  var v = $('#srch').val();
  console.log(v);
  $('#srch').parent('form').submit();
})
$('#srch').parent('form').submit(function(){
  console.log("submitted");
})
});
