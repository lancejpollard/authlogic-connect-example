$ = jQuery.noConflict();
Cufon.replace('h2, p, legend');

$(document).ready(function() {
  $form = $("#authentication_form");
  
  $('#page').jcarousel({
  	vertical: true,
      easing: 'BounceEaseOut',
      animation: 1000,
      scroll: 1,
      visible: 1,
      initCallback: carouselClickHandler,
      buttonNextHTML: null,
      buttonPrevHTML: null
  });

  // progressively enhance buttons
  $("li.oauth_provider").each(function(index, element) {
    var li = $(element);
    var input = $("input", li);
    input.css("display", "none");
    li.css("cursor", "pointer");
    li.data("oauth", input);
    li.click(function(event) {
      event.preventDefault();
      li.data("oauth").attr("checked", "checked");
      $form.submit();
      $form.find('input[name=submit]').click();
      return false;
    });
  });
});

function carouselClickHandler(carousel) {
  $('a.control, a.control2').bind('click', function() {
      carousel.scroll(jQuery.jcarousel.intval($(this).text()));
      return false;
  });
};