//$(function(){
$(document).on('turbolinks:load',function(){

	$('.notice-wrapper-close').on('click', function() {
		$('.notice-wrapper').fadeOut();
	});

	$(document).on('click','.mark_as_read', function() {
		$('#notification-container').html('<li>No new notifications</li>');
		//	alert('<%= @notifications.count %>');
		$('#notification_count').html("");
	});

	var notifications = $('.notifications').length; // to check if header and notification bar is present or not
//	alert(@notifications);
	function notif()
	{
		var user_id = $('.notifications').attr('data-id');
		$.ajax({
			url: '/users/'+user_id+'/notifications',
			type: 'GET',
			dataType: 'script',
		});
	}

	if(notifications >0) {
		setInterval(function() {
  		return notif();
		},30000);
	}

	var noticeBanner = $('.notice-wrapper');
	if(noticeBanner.length > 0) {
		setTimeout(function() {
		  noticeBanner.fadeOut();
		}, 3000);
	}
	$(document).click(function(e) {
		if($(e.target).parent().attr('class') === 'notice-wrapper-close') {
			noticeBanner = $('.notice-wrapper');
			noticeBanner.fadeOut();
		}
	});

});
