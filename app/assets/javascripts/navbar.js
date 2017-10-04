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

  var searchBar = $('input.search-box');
  $(searchBar).on('focus', function() {
    $(this).css("width", "560px");
  });

  var navEle = $("nav");
  var insideNav = false;
  navEle.hover(function() {
    insideNav = true;
  },
  function() {
    insideNav = false;
  }
  );

  $("body").on('click', function(event) {
    if(!insideNav) {
      searchBar.css("width", "350px");
    }

    /*
    if(event.target !== navEle && !(navEle.find(event.target).length > 0) && document.activeElement == searchBar) {
      searchBar.css("width", "350px");
    }*/
    if(accountDropDown.hasClass('show-it')) {
      accountDropDown.removeClass('show-it');
      accountDropDown.addClass('hide-it');
    }

  });

});
