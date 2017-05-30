$(function(){

	CKEDITOR.on('instanceReady', function(evt) {
    var editor = evt.editor;
		 var data = editor.getData();
    //alert('The editor named ' + editor.name + ' is now ready');
		$('#button_'+editor.name).attr('disabled',true);
		
		
    editor.on('focus', function(e) {
//      alert('The editor named ' + e.editor.name + ' is now focused');
  
 		e.editor.on('change',function(evt){
 			var data = editor.getData();
 				if(data=='')
				$('#button_'+editor.name).attr('disabled',true);
		else
				$('#button_'+editor.name).attr('disabled',false);		
 			
 		});
 		
 		
  	e.editor.on('key',function(evt){
				var data = editor.getData();
 				if(data==''){
 //				alert(evt.data.keyCode);
					if(evt.data.keyCode===32||evt.data.keyCode===13)
					{
					return false;
					}
					}
		});
	
  
    });
});

});
