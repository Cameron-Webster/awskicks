$(document).ready(function() {
  count = 0;


$('#srch').keyup(function(e){
  count += 1;
  if (count > 2) {
  var v = $('#srch').val();


  $('#srch').parent('form').submit();

  var currentURL = location.href;
  var search = /search/;
  if (search.test(currentURL.toString())){
  var newUrl = currentURL.replace(/search=[^&]*/, "search=" + v)
} else {
  var newUrl = currentURL + "&search=" + v
}

// history.replaceState(null,"", newUrl);
}
})

$(document).on("click", "li.genderbucket", function(){

  var para = $(this).data('val');

  $("#generoo").val(para);
  $('#srch').parent('form').submit();
})

$(document).on("click", "li.brandbucket", function(){

  var para = $(this).data('val');
  var currentdata = $("#brandoo").val();
  // if (currentdata) {
  //   $("#brandoo").val(currentdata + "," + para)
  // } else {
  $("#brandoo").val(para);

  $('#srch').parent('form').submit();
})

// window.addEventListener('popstate', function(e){
//       history.replaceState(null,"", "http://localhost:3000/");
//       window.location.reload();
// })

// launch modal

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
