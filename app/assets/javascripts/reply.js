$(document).on('turbolinks:load',function(){
	$('.reply_button').click(event,function(){
		//alert('clicked');
		event.preventDefault();
		var id = $(this).attr('id');
		id = id.substr(6);              //removing the 'answer' from id
		id = 'reply'+id;								//adding the 'reply' into id
		$('#'+id).fadeToggle();
	});
});
