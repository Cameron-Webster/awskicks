$(document).ready(function() {
  var initial_search = false;
  count = 0;


  $('#srch').keyup(function(e){
  $('#products').prepend("<div id='loading_sceen'></div>");

    count += 1;
    if (count > 2) {
      var v = $('#srch').val();
      if (!initial_search) {
        setTimeout(function(){

          if (v == $('#srch').val()) {
            initial_search = true;
            $('.jumbotron').addClass('jumbotronLight').removeClass('jumbotron');

            $('#stubby').parent('form').submit();

          }
        }, 500)
      } else {
          setTimeout(function(){

          if (v == $('#srch').val()) {
        $('#stubby').parent('form').submit();

      }
    }, 200)
      }

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

//-------------sorting



$(document).on("change", "select#sorting", function(){
  console.log("slect event");
  var sort = $(this).val();
  $("#sortoo").val(sort);
  $('#stubby').parent('form').submit();
})

// $(document).on("select", "select#sorting option", function(){
//   console.log("slect event");
//   var sort = $(this).val();
//   $("#sortoo").val(sort);
//    $('#stubby').parent('form').submit();
// })
//-------------Gender aggs

$(document).on("click", "li.genderbucket", function(){

  var para = $(this).data('val');

  $("#generoo").val(para);
  $('#stubby').parent('form').submit();
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
  $('#stubby').parent('form').submit();
});

//--------------------------Price aggs

// $(document).on("click", "li.pricebucket", function(){

//   var that = $(this);

//   var para = that.data('val');

//   var currentdata = $("#priceoo").val();

//   if (that.hasClass("active")) {

//       var textReplace = new RegExp("," + para + "|" + para + "|" + para + ",");

//      currentdata = currentdata.replace(textReplace,"");
//     $("#priceoo").val(currentdata);

//     that.removeClass("active");

//   } else {


//     that.addClass("active");



//   if (para != "" && currentdata != "") {
//     currentdata = currentdata + "," + para

//     $("#priceoo").val(currentdata)
//   } else {
//   $("#priceoo").val(para);
// }
// }
//   $('#srch').parent('form').submit();
// })







// window.addEventListener('popstate', function(e){
//       history.replaceState(null,"", "http://localhost:3000/");
//       window.location.reload();
// })

// launch modal

$(document).on('click', ".mod2, .sneaker_thumb_buk, .sneaker_title, .cancelBucket",function(){
  var sneak = $(this).data('rails');


  $.ajax({
    type: "GET",
    url: "/modal/" + sneak,
    success: function(data){

    }
  })
});

//Delete Pin From Bucket

$(document).on('click', ".delete", function(){
      var bucket_arr = window.location.href.split("/");
     var sneak = $(this).data('pin');

     $('.confirm_delete').attr("href", "/pins/" + sneak + "/" + bucket_arr[bucket_arr.length - 1]);

});


});
