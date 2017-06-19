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
// $('#srch').parent('form').submit(function(){
//   console.log("submitted");
// })
});
