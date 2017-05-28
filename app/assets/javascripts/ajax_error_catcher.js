jQuery(function(){
	$(document).on("ajax:error",function(xhr,status,error){
		alert(status.responseText);
		alert(error);
	});
	
});
