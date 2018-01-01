$.fn.scrollView = function () {
  return this.each(function () {
    $('html, body').animate({
      scrollTop: $(this).offset().top
    }, 1000);
  });
}

function getLevel(parent) {
  var lastLetter, classLen, classList = parent.attr('class').split(/\s+/);
  for(var i = 0; i < classList.length; i++) {
    if(classList[i].slice(-7, -2) == "level") {
      classLen = classList[i].length;
      lastLetter = parseInt(classList[i].charAt(classLen - 1));
      if(!isNaN(lastLetter)) return (lastLetter + 1);
    }
  }
  return 0;
}

function resetSubmitReply() {
  var parentType = $('input[name="parent_type"]');
  if(parentType.val().slice(-6) == "_reply") {
    parentType.val(parentType.val().slice(0, -6));
    var parentID = $('input[name="parent_id"]');
    parentID.val(parentType.parent().parent().attr('id').split('_').pop());
    $('.reply-header').hide();
    $('.cancel-reply').hide();
    $('.comment-header').show();
  }
}

//$(function(){
$(document).on('turbolinks:load',function(){
	$(document).on('click','.answerreply_loadmore',function(){
		//alert('clicked');
		event.preventDefault();
		var id = $(this).attr('id');
		$(this).hide();
		var answerid = id;
		id = id.substr(21);              //removing the 'answer' from id
		var reply_id = 'reply_'+id;								//adding the 'reply' into id
		var individual_reply_id = 'individual_reply_'+id;
		var last_id = $('.'+individual_reply_id).last().attr('data-id');
		//alert(id);
		var question_id = $("#"+answerid).attr('data-questionid');
		var address = '/questions/'+question_id+'/answers/'+id+'/collection';
			var replies_id = 'replies_'+id;
			$.ajax({
				url: address,
				type: 'GET',
				dataType: 'script',
				data: {
					replies_id: replies_id,
					last: last_id
				},
				success: function(data){
				}
			});
	});




	$(document).on('click','.reply_button',function(){
		//alert('clicked');
		event.preventDefault();
		var id = $(this).attr('id');
		var answerid = id;
		id = id.substr(7);              //removing the 'answer' from id
		var reply_id = 'reply_'+id;								//adding the 'reply' into id
		//alert(id);
		var question_id = $("#"+answerid).attr('data-questionid');
		var address = '/questions/'+question_id+'/answers/'+id+'/collection';
		if(!$('#'+reply_id).is(":visible"))
		{
			var replies_id = 'replies_'+id;
			$.ajax({
				url: address,
				type: 'GET',
				dataType: 'script',
				data: {
					replies_id: replies_id
				},
				success: function(data){
					$('#'+reply_id).show();
				}
			});
		}
	});

	$(document).on('click', '.reply-to-reply a', function(event) {
		event.preventDefault();
    var replyButtonContainer = $(this).parent();
		var parentReplyID = replyButtonContainer.children('input[name="parent_reply_id"]').val();
		$('input[name="parent_id"]').val(parentReplyID);
		var parentType = $('input[name="parent_type"]');
    if(parentType.val().slice(-6) != "_reply") parentType.val(parentType.val() + '_reply');
    var replyTo = replyButtonContainer.parent().find('.author-name a').text();
    $('.reply-header').text('Reply to ' + replyTo);
    $('.comment-header').hide();
    $('.reply-header').show();
    $('.cancel-reply').show();
		$('.comment-header').scrollView();
		$('.submit-article-reply textarea').focus();
	});

  $(document).on('click', '.cancel-reply a', function(event) {
    event.preventDefault();
    resetSubmitReply();
  });
});
