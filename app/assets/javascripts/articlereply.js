$(document).on('turbolinks:load',function(){
	$('.articlereply_button').click(event,function(){
		event.preventDefault();
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
						$('#'+replies_id).append('<li>'+element.body+' '+'<br>'+element.created_at+'</li>');
						});
						}
						});
					}
				});
			});
