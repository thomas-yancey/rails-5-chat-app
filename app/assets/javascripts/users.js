// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

App.activeUsers = App.cable.subscriptions.create({
  channel:'AppearanceChannel',
   room: window.location.pathname.split("/")[2]
 }, {
  received: function(data) {
    $('.alert-success').text(data.username + " has joined the chat");
    $(function() {
       $('.alert-success').delay(500).fadeIn('normal', function() {
          $(this).delay(2500).fadeOut();
       });
       $('html, body').animate({scrollTop: $(document).height()}, 'slow');
    });
  }
});
