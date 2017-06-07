//$(function(){
$(document).on('turbolinks:load',function(){

	$(document).on('click','.articlereply_loadmore',function(){
		event.preventDefault();
		var id = $(this).attr('id');
			$(this).hide();
		var articleid = id;
		id = id.substr(22);				
		var reply_id = 'articlereply_'+id;
		var individual_reply_id = 'individual_articlereply_'+id;
		var last_id = $('.'+individual_reply_id).last().attr('data-id');
		var address = '/articles/'+id+'/collection';		
	//	alert(last_id);		
				var replies_id = 'articlereplies_'+id;
				
				$.ajax({
					url: address,
					type: 'GET',
					dataType: 'script',
					data: {
						last: last_id,
						replies_id: replies_id
						
					},
				
					success: function(data){
		//				$('#'+articleid).show();	
						}
			
	});
	});
	
	$(document).on('click','.articlereply_button',function(){
		event.preventDefault();
		//$(this).prop("disabled","disabled");
		var id = $(this).attr('id');
		var articleid = id;
		id = id.substr(8);				//removing the 'article' from id 
		var reply_id = 'articlereply_'+id; // adding the 'article reply'
		
		var address = '/articles/'+id+'/collection';
		if(!$('#'+reply_id).is(':visible'))
			{
				var replies_id = 'articlereplies_'+id;
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
