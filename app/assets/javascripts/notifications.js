$(document).ready(function(){

$(".notification_icon").on("click", function(){

   $.ajax({
    type: "GET",
    url: '/homepage_notifications/markread/',
    success: function(data){
      $(".notification_active").addClass("noDisplay");
    }
  });
});

});
