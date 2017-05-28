$(function(){
	$(document).on('click','.grouparticlereply_button',function(){
		event.preventDefault();
		var id = $(this).attr('id');
		var articleid = id;
		id = id.substr(13);      //removing the 'grouparticle' from id
		var reply_id = 'grouparticlereply_'+id; //adding the grouparticle reply' 
		var group_id = $('#'+articleid).attr('data-groupid');
		var address = '/groups/'+group_id+'/group_articles/'+id+'/collection';
		if(!$('#'+reply_id).is(':visible'))
		{
			var replies_id =  'grouparticlereplies_'+id;
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
		
