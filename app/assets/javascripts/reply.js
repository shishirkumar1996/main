$(document).on('turbolinks:load',function(){
	$('.reply_button').click(event,function(){
		//alert('clicked');
		event.preventDefault();
		var id = $(this).attr('id');
		var answerid = id;
		id = id.substr(7);              //removing the 'answer' from id
		var reply_id = 'reply_'+id;								//adding the 'reply' into id
		//alert(id);
		var question_id = $("#"+answerid).attr('data-questionid');
		var address = '/questions/'+question_id+'/answers/'+id+'/collection.json';
		if(!$('#'+reply_id).is(":visible"))
		{
			$('#'+reply_id).show();
			var replies_id = 'replies_'+id;
			$.getJSON(address,function(data){
			$.each(data,function(index,element){
				$("#"+replies_id).append('<li><a class = \"profile_pic\"'+
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
