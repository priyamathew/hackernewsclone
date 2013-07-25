function hide_and_slide(click_element,hidden ) {
  var el = $(click_element)
  var hidesy = el.find($(hidden))
  el.find($(hidden)).hide();
  // form_object.parent().addClass("clicktohide");
  $(el).on("click", function(e) {
    e.stopPropagation();
    e.preventDefault();
    console.log(el)
    hidesy.toggle('easing');
  });
};


$(document).ready(function() {

  $("form#vote").on("click", function(e){
    e.preventDefault();
    $(this).fadeOut();
    var url = $(this).attr('action');
    var clickedVoteButton = this;

    $.post(url, function(response) {  
      $(clickedVoteButton).siblings('#points').css("color","green").html(response.vote_count+' points');  
    });
  });

  hide_and_slide('#profile', 'form')
  hide_and_slide('#login', 'form')
  hide_and_slide('#logout', 'form')
  console.log($('#login form'))

  


});


