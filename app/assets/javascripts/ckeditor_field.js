$(function(){

	CKEDITOR.on('instanceReady', function(evt) {
    var editor = evt.editor;
		 var data = editor.getData();
    //alert('The editor named ' + editor.name + ' is now ready');
		$('#button_'+editor.name).attr('disabled',true);
		
		
    editor.on('focus', function(e) {
//      alert('The editor named ' + e.editor.name + ' is now focused');
  
 /* 
  	e.editor.on('keydown',function(evt){
  		alert('sdkfjjk');
  	});
  	e.editor.on('keyup',function(evt){
			alert('sdjkf');
			if(data=='')
			{
				
				$('#button_'+editor.name).attr('disabled',true);
			}
		else
				$('#button_'+editor.name).attr('disabled',false);		
		});
	*/
  
    });
});


});
