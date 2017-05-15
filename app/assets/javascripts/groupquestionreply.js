$(document).on('turbolinks:load',function(){
	$('.groupanswerreply_button').click(event,function(){
		event.preventDefault();
		
		var id = $(this).attr('id');
		var answerid = id;
		id = id.substr(12);      //removing the 'groupanswer' from id
		var reply_id = 'groupanswerreply_'+id; //adding the groupanswer reply' 
		
		var question_id = $('#'+answerid).attr('data-questionid');
		var group_id = $('#'+answerid).attr('data-groupid');
		var address = '/groups/'+group_id+'/group_questions/'+question_id+'/groupanswers/'+id+'/collection.json';
		if(!$('#'+reply_id).is(':visible'))
		{
			$('#'+reply_id).show();
			var replies_id= 'groupanswerreplies_'+id;
			$.getJSON(address,function(data){
				$.each(data,function(index,element){
					$('#'+replies_id).append('<li><a class = \"profile_pic\"'+
						"href = "+element.redirect_address+">"
						+"<img src = "+element.image_address+"></a>"
//			+"sadfsdfa</a>"
						+"<strong>"+element.username+"</strong><br>"
					+element.body+' '+'<br>'+element.created_at+'</li>');
				});
			});
		}
	});
});
		
