$(document).ready(function(){

$(".notification_icon").on("click", function(){

   $.ajax({
    type: "GET",
    url: '/homepage_notifications/read/',
    success: function(data){
      $(".notification_active").addClass("noDisplay");
    }
  });
});

});
