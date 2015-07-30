$(document).ready(function() {
  $('.box').click(function() {
  var box_id = $(this).val();
      $.ajax({
        url: '/users/delete_user_restaurant',
        data: {my_id: box_id},
        method: "POST"
      }).done(function(data){
        console.log(data)
      });

  });
});
