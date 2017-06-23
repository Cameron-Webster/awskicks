$(document).ready(function() {


// modal -------------------------------------------------------

// Top left + add to bucket

  $(document).on('click', ".bucketListButton", function(){
    // disappear button
    $(".bucketListButton").addClass("noDisplay");
    // remove picture show bucket list
    $(".bucketList").removeClass("noDisplay");
    $(".image_large").addClass("noDisplay");

  });

  $(document).on('click', ".bucketList select option", function(){
console.log($(this).parent('form'));
    $(this).closest('form').submit();
     $(".image_large").removeClass("noDisplay");
  });


});



