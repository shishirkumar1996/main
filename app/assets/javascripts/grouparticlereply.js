$(document).on('turbolinks:load',function(){
	$('.grouparticlereply_button').click(event,function(){
		event.preventDefault();
		var id = $(this).attr('id');
		var articleid = id;
		id = id.substr(13);      //removing the 'grouparticle' from id
		var reply_id = 'grouparticlereply_'+id; //adding the grouparticle reply' 
		var group_id = $('#'+articleid).attr('data-groupid');
		var address = '/groups/'+group_id+'/group_articles/'+id+'/collection.json';
		if(!$('#'+reply_id).is(':visible'))
		{
			$('#'+reply_id).show();
			var replies_id =  'grouparticlereplies_'+id;
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
		
