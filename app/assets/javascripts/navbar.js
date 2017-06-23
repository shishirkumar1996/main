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
  $('#account').on('click', function() {
    accountDropDown.toggleClass('hide-it');
    accountDropDown.toggleClass('show-it');
  });
/*
  window.onClick = function(event) {
    if (!event.target.matches('#account')) {
      var dropDownList = $('#account-drop-down');
      if(dropDownList.classList.contains('show')) {
        dropDownList.classList.remove('show');
      }
    }
  };
*/

});
