$( document ).ready(function() {
  // submit messages
  $('#new_message').on ('submit', function(){
    event.preventDefault();
    // make sure there is content
    if ($('#new_message [name="message[content]"]').val() === ""){
      return false;
    }

    $.ajax({
      url: this.action,
      data: $(this).serialize(),
      method: "post"
    }).done( function(res){
      $('#new_message [name="message[content]"]').val("");
    });
  });
  // submit users
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

  if ($("#messages").length > 0){
    scrollBottom();
  }
});


var memberAppendBuilder = function(userData){
   return "<li><h5>" + userData.username + "</h5></li>";
};

var scrollBottom = function(){
  $('html, body').animate({scrollTop: $(document).height()}, 'slow');
}