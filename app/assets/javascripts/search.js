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

//-------------Gender aggs

$(document).on("click", "li.genderbucket", function(){

  var para = $(this).data('val');

  $("#generoo").val(para);
  $('#srch').parent('form').submit();
})

//--------------Brand aggs

$(document).on("click", "li.brandbucket", function(){

  var that = $(this);

  var para = that.data('val');

  var currentdata = $("#brandoo").val();

  if (that.hasClass("active")) {

      var textReplace = new RegExp("," + para + "|" + para + "|" + para + ",");

     currentdata = currentdata.replace(textReplace,"");
    $("#brandoo").val(currentdata);

    that.removeClass("active");

  } else {


    that.addClass("active");



  if (para != "" && currentdata != "") {
    currentdata = currentdata + "," + para

    $("#brandoo").val(currentdata)
  } else {
  $("#brandoo").val(para);
}
}
  $('#srch').parent('form').submit();
});

//--------------------------Price aggs

$(document).on("click", "li.pricebucket", function(){

  var that = $(this);

  var para = that.data('val');

  var currentdata = $("#priceoo").val();

  if (that.hasClass("active")) {

      var textReplace = new RegExp("," + para + "|" + para + "|" + para + ",");

     currentdata = currentdata.replace(textReplace,"");
    $("#priceoo").val(currentdata);

    that.removeClass("active");

  } else {


    that.addClass("active");



  if (para != "" && currentdata != "") {
    currentdata = currentdata + "," + para

    $("#priceoo").val(currentdata)
  } else {
  $("#priceoo").val(para);
}
}
  $('#srch').parent('form').submit();
})







// window.addEventListener('popstate', function(e){
//       history.replaceState(null,"", "http://localhost:3000/");
//       window.location.reload();
// })

// launch modal

$(document).on('click', ".mod2, .cancelBucket",function(){
  var sneak = $(this).data('rails');

  $.ajax({
    type: "GET",
    url: "/modal/" + sneak,
    success: function(data){

    }
  })
})
});
