// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


App.messages = App.cable.subscriptions.create({
  channel:'MessagesChannel',
   room: window.location.pathname.split("/")[2]
 }, {
  received: function(data) {
    $('#messages').append(data.message);
    $('html, body').animate({scrollTop: $(document).height()}, 'slow');
  }
});
