$(document).on('turbolinks:load', function() {
  var article_reply_opts = spinnerConfig(6, 13, '#548be5');
  var replySpinner = new Spinner(article_reply_opts).spin();
  var loadMoreBlock = $('.load-more-block')
  if(loadMoreBlock.length > 0) loadMoreBlock.append(replySpinner.el);
  var loadMoreBtn = $('.load-more-button');
  loadMoreBtn.on('click', function() {
    $(this).hide();
    $('.spinner').show();
  });
});
