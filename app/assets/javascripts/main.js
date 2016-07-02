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

  if ($("#messages")){
    $('html, body').animate({scrollTop: $(document).height()}, 'slow');
  }
});