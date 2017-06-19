$(document).ready(function() {
  count = 0;

console.log("we are transmitting");
$('#srch').keyup(function(e){
  count += 1;
  if (count > 2) {
  var v = $('#srch').val();
  console.log(v);
  $('#srch').parent('form').submit();

  var currentURL = location.href;
  var search = /search/;
  if (search.test(currentURL.toString())){
  var newUrl = currentURL.replace(/search=[^&]*/, "search=" + v)
} else {
  var newUrl = currentURL + "?search=" + v
}
console.log(newUrl);
history.replaceState(null,"", newUrl);
}
})

window.addEventListener('popstate', function(e){
      history.replaceState(null,"", "http://localhost:3000/");
      window.location.reload();
})

$(document).on('click', ".mod2",function(){
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
