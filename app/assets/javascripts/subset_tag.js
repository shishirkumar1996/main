function other_function3(item,address)
{
	var dat = [];
	var x;
	$.ajaxSetup({
		async: false
		});
		$.getJSON(address,function(data){
			$.each(data,function(index,element){
				dat.push({id: element.id,text:element.text});
				});
				});
			return dat;
		}
		
		
		
		
