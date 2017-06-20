$(document).on('turbolinks:load',function() {
  $('.mobile-nav-icon').click(function() {
    var nav = $('.main-nav');
    var icon = $('.mobile-nav-icon i');

    if (icon.hasClass('fa-bars')) {
        nav.slideDown(200);
        icon.addClass('fa-times-circle');
        icon.removeClass('fa-bars');
    } else {
        nav.slideUp(200, function() {
          // function call-back to remove inline display:none property
          nav.removeAttr('style');
        });
        icon.addClass('fa-bars');
        icon.removeClass('fa-times-circle');
    }
  });
});
