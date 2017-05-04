$(document).on('turbolinks:load',function(){
	$('.groupanswerreply_button').click(event,function(){
		event.preventDefault();
		var id = $(this).attr('id');
		var articleid = id;
		id = id.substr(13);      //removing the 'grouparticle' from id
		var reply_id = 'groupanswerreply_'+id; //adding the grouparticle reply' 
		var question_id = $('#'+answerid).attr('data-questionid');
		var group_id = $('#'+answerid).attr('data-groupid');
		var address = '/groups/'+group_id+'/questions'+question_id+'/answers/'+id+'/collection.json';
		if(!$('#'+reply_id).is(':visible'))
		{
			$('#'+reply_id).show();
			var replies+id 'groupanswerreplies+'+id;
			$.getJSON(address,function(data){
				$.each(data,function(index,element){
					$('#'+replies_id).append('<li>'+element.body+' '+element.created_at+'</li>');
				});
			});
		}
	});
});
		
