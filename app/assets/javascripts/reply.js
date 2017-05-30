$(function(){
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
});
