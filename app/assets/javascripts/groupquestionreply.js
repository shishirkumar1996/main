//$(function(){
$(document).on('turbolinks:load',function(){
	$(document).on('click','.groupanswerreply_loadmore',function(){
		event.preventDefault();
		
		var id = $(this).attr('id');
		$(this).hide();
		var answerid = id;
		id = id.substr(26);      //removing the 'groupanswer' from id
		var reply_id = 'groupanswerreply_'+id; //adding the groupanswer reply' 
		var individual_reply_id = 'individual_groupanswer_'+id;
		var last_id = $('.'+individual_reply_id).last().attr('data-id');
		var question_id = $('#'+answerid).attr('data-questionid');
		var group_id = $('#'+answerid).attr('data-groupid');
		var address = '/groups/'+group_id+'/group_questions/'+question_id+'/groupanswers/'+id+'/collection';
			var replies_id= 'groupanswerreplies_'+id;
			
			$.ajax({
				url: address,
				type: 'GET',
				dataType: "script",
				data: {
					last: last_id,
					replies_id: replies_id
				},
				success: function(data){
				}
				});
	});



	$(document).on('click','.groupanswerreply_button',function(){
		event.preventDefault();
		
		var id = $(this).attr('id');
		var answerid = id;
		id = id.substr(12);      //removing the 'groupanswer' from id
		var reply_id = 'groupanswerreply_'+id; //adding the groupanswer reply' 
		
		var question_id = $('#'+answerid).attr('data-questionid');
		var group_id = $('#'+answerid).attr('data-groupid');
		var address = '/groups/'+group_id+'/group_questions/'+question_id+'/groupanswers/'+id+'/collection';
		if(!$('#'+reply_id).is(':visible'))
		{
			var replies_id= 'groupanswerreplies_'+id;
			$.ajax({
				url: address,
				type: 'GET',
				dataType: "script",
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
		
