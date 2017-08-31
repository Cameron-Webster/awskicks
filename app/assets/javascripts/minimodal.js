$(document).ready(function(){



// When the user clicks on the button, open the modal
$(document).on('click', "#myBtn, #save_message", function(){



    var miniMod = $(".miniMod")
  miniMod.css("display", "block");
  $(".bucketListForm select").focus();

  //closing the modal
  $(document).on("click", ".close", function(){
    var simple_form = $("form.simple_form.new_pin")[0];
    if (simple_form) {
      simple_form.reset();
    }

    var bucket_list_pages = $(".pretty_bucket_list_outer");
    var bucket_list_end = bucket_list_pages.slice(1);

      $(bucket_list_pages[0], ".newBucket, .card2").removeClass("noDisplay"); // show 1st bucket page
      $(bucket_list_end).addClass("noDisplay"); //hide all others
      $(".price_watch_container, .noPriceWatch").addClass("noDisplay");
      $(".card3").velocity({ translateX: ['100%', '0%'] });
      $(".card3").css("display", "none");
      miniMod.css("display", "none");

  })

})
$(document).on("click", document, function(event){
      if (event.target == $(".miniMod")) {
        $(".miniMod").css("display", "none");
      }
});

// Select Bucket for Pin



$(document).on('click', ".pretty_bucket_list>li", function(){
    var bucket = $(this).data("bucket");
    $(".pin_bucket input#pin_bucket").val(bucket);
    $(".price_watch_container, .noPriceWatch").removeClass("noDisplay");
    $(".pretty_bucket_list_outer, .newBucket").addClass("noDisplay");

});

// Select whether Pricewatch is required

  $(document).on('click', ".noPriceWatch, .price_watch_container ul li", function(){
          var price_val = $(this).data("price");

        $('.pin_price_watch input#pin_price_watch').val(price_val);
        $(".price_watch_container, .noPriceWatch").addClass("noDisplay");
        $(".pretty_bucket_list_outer, .newBucket").removeClass("noDisplay");
        $(".pinSubmit").closest('form').submit();

  });

  // display create new bucket screen
$(document).on('click', ".displayNewBucket", function(){
   $(".card3").css("display", "block");
    $(".card2").addClass("noDisplay");
    $(".card3").velocity({ translateX: ['0%', '100%'] });
});

// select pricewatch for new bucket

  $(document).on('click', ".noPriceWatch_new_bucket, .price_watch_container_new_bucket ul li", function(){

           var price_val = $(this).data("price");
          var bucket_name = $("input#bucket_name")
          if (bucket_name.val() == "") {

            $(".bucket_name_errors").text("Bucket name cannot be empty");
            return false;
          } else {

        $('.bucket_pins_price_watch input#bucket_pins_attributes_0_price_watch').val(price_val);
        $(".card3").css("display", "none");
        $(".card3").velocity({ translateX: ['100%', '0%'] });
        $(".card2").removeClass("noDisplay");
        $(".bucketSubmit").closest('form').submit();
      }
  });

  $(document).on('click', ".view_more", function() {
    var current_page = parseInt($(this).data('page'));

    var all_pages = document.getElementsByClassName("pretty_bucket_list_outer");
    var next_page = current_page + 1;
    all_pages[current_page].className += " noDisplay";
    all_pages[next_page].classList.remove("noDisplay");
  });

    $(document).on('click', ".previous", function() {
    var current_page = parseInt($(this).data('page'));

    var previous_page = current_page - 1;
    var all_pages = document.getElementsByClassName("pretty_bucket_list_outer");

    all_pages[current_page].className += " noDisplay";
    all_pages[previous_page].classList.remove("noDisplay");
  })

 $(document).on('click', ".noPriceWatchBucket, #bucket_pins_attributes_0_price_watch option", function(){
        $(".bucketSubmit").closest('form').submit();
  });

  $(document).on('click',".modal-backdrop", function(){
      $(".modal-backdrop").hide();
  });

  $(document).on("click", '.close-mini, .close-delete', function(){
      $('.miniMod').css("display", "none");

  });


})
