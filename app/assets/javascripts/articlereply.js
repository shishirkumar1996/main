$(function(){
	$(document).on('click','.articlereply_button',function(){
		event.preventDefault();
		//$(this).prop("disabled","disabled");
		var id = $(this).attr('id');
		var articleid = id;
		id = id.substr(8);				//removing the 'article' from id 
		var reply_id = 'articlereply_'+id; // adding the 'article reply'
		
		var address = '/articles/'+id+'/collection.json';
		if(!$('#'+reply_id).is(':visible'))
			{
				$('#'+reply_id).show();
				var replies_id = 'articlereplies_'+id;
				$.getJSON(address,function(data){
					if(data.length==0)
						{
//						$('#'+replies_id).append("no replies");
						}
					else
					{
					$.each(data,function(index,element){
						$('#'+replies_id).append('<li><a class = \"profile_pic\"'+
						"href = "+element.redirect_address+">"
						+"<img src = "+element.image_address+"></a>"
//			+"sadfsdfa</a>"
						+"<strong>"+element.username+"</strong><br>"
					+element.body+' '+'<br>'+element.created_at+'</li>');
						});
						}
						});
					}
				});
			});
