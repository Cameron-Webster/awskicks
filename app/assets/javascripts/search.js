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
            // $('.jumbotron').addClass('jumbotronLight').removeClass('jumbotron');

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

//-------------Size Aggs

$(document).on('click', "ul.dropdown-menu.size_drop_down form input[type='button']", function(){
  var size = $("#sizeoo").val().split(',')[0]
  if ($("ul.dropdown-menu.size_drop_down form input[type='checkbox']").is(':checked')){
    size += "," + '0.5'
  }
   $("#sizeoo").val(size)
   $('#stubby').parent('form').submit();
    $(this).closest(".dropdown").removeClass("open");


});

$(document).on("change", ".size_drop_down input[type='radio']", function(){
    size = $(this).data('size');

    $("#sizeoo").val(size);

});


//-------------Gender aggs

$(document).on('click', "ul.dropdown-menu.gender_drop_down input[type='button']", function(e){
  var i;
  var search_terms = "";
var options = $("ul.dropdown-menu.gender_drop_down input[type='checkbox']:checked");

  if (options.length < 2){
      search_terms = options.data('val');
  } else {
    search_terms = "";
  }

$("#generoo").val(search_terms);
$('#stubby').parent('form').submit();
});



//--------------Brand aggs

$(document).on('click', "ul.dropdown-menu.brand_drop_down input[type='button']", function(){
  var i;
  var search_terms = "";
  var options = $("ul.dropdown-menu.brand_drop_down input[type='checkbox']:checked");
  $.each(options, function(i, e){
    search_terms += "," + $(this).data('val');
  })
  $("#brandoo").val(search_terms);
   $('#stubby').parent('form').submit();
});




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
     console.log(sneak);

     $('.confirm_delete').attr("href", "/pins/" + sneak + "/" + bucket_arr[bucket_arr.length - 1]);

});


});
