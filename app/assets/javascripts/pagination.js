$(function(){

  var more_posts_url;
  if ($('#infinite-scrolling').length > 0) {
    $(window).on('scroll', function() {
 // alert($(window).scrollTop()+','+$(document).height());	
  more_posts_url = $('.pagination .next_page a').attr('href');
  if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
    $('.pagination').html('Loading...');
    $.getScript(more_posts_url);
    }
    return;
    });
   return;
  }
});
