$(function(){
  $(".list_view_btn").click(function(){
    if($(".event_listing").css("display") == "none" ){
      $(".calendar").hide();
      $(".calendar-header").hide();
      $(".event_listing").show();
      $(this).text("Calendar View");
    } else {
      $(".calendar").show();
      $(".calendar-header").show();
      $(".event_listing").hide();
      $(this).text("List View")
    }



  });
});