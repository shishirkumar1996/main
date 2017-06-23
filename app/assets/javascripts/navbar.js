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
  var accountDropDown = $('#account-drop-down');
  console.log(accountDropDown);
  $('#account').on('click', function(event) {
    event.stopPropagation();
    accountDropDown.toggleClass('hide-it');
    accountDropDown.toggleClass('show-it');
  });

  $(document).on('click', function(event) {
    if(accountDropDown.hasClass('show-it')) {
      accountDropDown.removeClass('show-it');
      accountDropDown.addClass('hide-it');
    }

  });


});
