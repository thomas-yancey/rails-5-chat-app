// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

App.activeUsers = App.cable.subscriptions.create({
  channel:'AppearanceChannel',
   room: window.location.pathname.split("/")[2]
 }, {
  received: function(data) {
    if (data.appearance === true){
      userAppear(data);
    };
    if (data.appearance === false){
      userDisappear(data);
    };
  }
});

var userAppear = function(data){
  if ($('#messages').length > 0){
    $('.alert-success').text(data.username + " has joined the chat");
    debugger
    $(userImgIdConstructor(data)).show();
    scrollBottom();
    alertFade('.alert-success');
  }
}

var userDisappear = function(data){
  $('.alert-info').text(data.username + " has left the chat");
  $(userImgIdConstructor(data)).hide();
  scrollBottom();
  alertFade('.alert-info');
}


var userImgIdConstructor = function(data){
  return "#" + data.user_id + "-active";
}

var alertFade = function(el) {
   $(el).delay(500).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
   });
}

