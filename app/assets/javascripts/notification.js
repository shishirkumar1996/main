$(function(){

$(document).on('click','.mark_as_read',function(){
	$('#notification-container').html('<li>No new notifications</li>');

//	alert('<%= @notifications.count %>');
	
	$('#notification_count').html("");

});


	var notifications = $('.notifications').length; // to check if header and notification bar is present or not
//	alert(@notifications);
	if(notifications >0)
		setInterval(function() {
  return notif();
},30000);

		function notif()
		{
			var user_id = $('.notifications').attr('data-id');
			$.ajax({
				url: '/users/'+user_id+'/notifications',
				type: 'GET',
				dataType: 'script',
		});
		}	
});
