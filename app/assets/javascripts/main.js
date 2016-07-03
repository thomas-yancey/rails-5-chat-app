$( document ).ready(function() {
  $('.new_message').on ('click', function(){
    event.preventDefault();
    $.ajax({
      url: this.action,
      data: $(this).serialize(),
      method: "post"
    }).done( function(res){
    });
  });

  $('#add-users input').on ('click', function(){
    var userId = $(this).attr("id").split("-")[0];
    var data = {user_id: userId};
    $.ajax({
      url: this.action,
      data: data,
      method: 'post'
    }).done(function(res){
      var userData = JSON.parse(res);
      $('#' + userData.id + "-add-member").parent().remove();
      $('#users-list').append(memberAppendBuilder(userData));
    });
  });

  if ($("#messages")){
    $('html, body').animate({scrollTop: $(document).height()}, 'slow');
  }
});


var memberAppendBuilder = function(userData){
   return "<li><h5>" + userData.username + "</h5></li>";
};