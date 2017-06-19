$(document).on('turbolinks:load',function() {
  $('.mobile-nav-icon').click(function() {
    var nav = $('.main-nav');
    var icon = $('.mobile-nav-icon i');

    nav.slideToggle(200);

    if (icon.hasClass('fa-bars')) {
        icon.addClass('fa-times-circle');
        icon.removeClass('fa-bars');
    } else {
        icon.addClass('fa-bars');
        icon.removeClass('fa-times-circle');
    //    nav.removeAttr('style');
    }
  });
});
