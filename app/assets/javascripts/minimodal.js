$(document).ready(function(){


// When the user clicks on the button, open the modal
$(document).on('click', "#myBtn", function(){
    var miniMod = $(".miniMod")
  miniMod.css("display", "block");
  $(".bucketListForm select").focus();

  //closing the modal
  $(document).on("click", ".close", function(){
    var simple_form = $("form.simple_form.new_pin")[0];
    if (simple_form) {
      simple_form.reset();
    }
      $(".bucketListForm .pin_bucket, .newBucket, .card2").removeClass("noDisplay");
      $(".bucketListForm .pin_price_watch, .noPriceWatch").addClass("noDisplay");
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

// select bucket to add pin to and display add pricewatch screen
$(document).on('click', ".bucketListForm select option", function(){
  $(".bucketListForm .pin_bucket").addClass("noDisplay");
  $(".bucketListForm .pin_price_watch, #pin_price_watch").removeClass("noDisplay");
  $(".noPriceWatch").removeClass("noDisplay");
  $(".newBucket").addClass("noDisplay");


});

// display create new bucket screen
$(document).on('click', ".displayNewBucket", function(){
   $(".card3").css("display", "block");
    $(".card2").addClass("noDisplay");
    $(".card3").velocity({ translateX: ['0%', '100%'] });
});

  $(document).on('click', ".noPriceWatch, #pin_price_watch option", function(){
        $(".pinSubmit").closest('form').submit();
  });

 $(document).on('click', ".noPriceWatchBucket, #bucket_pins_attributes_0_price_watch option", function(){
        $(".bucketSubmit").closest('form').submit();
  });

  $(document).on('click',".modal-backdrop", function(){
      $(".modal-backdrop").hide();
  });


})
