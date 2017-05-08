$(document).on('turbolinks:load', function() {
$(document).on('focus','#questionterm',function(event){
//	alert('high');
	$("#questionterm").autocomplete({
	//source: ['foo','food','for','something']
	
	source: function(request,response){
		$.ajax({
			url: '/search_question',
			dataType: 'json',
			data: {
				term: request.term,
	},
	success: function(data){
		response(data);
	}
	});
	},
	select: function(event,ui){
		var x='',y='',i = 0;
	//	alert(ui.item.id);
	//	alert(ui.item.text);
	//	for(i = 0;i<ui.item.label.length;i++)
	//	if(ui.item.label[i]==',')
	//	break;
//		else
//		x = x+ui.item.label[i];
//		y = ui.item.label.substr(i+1);
x = ui.item.id;
y = ui.item.text;
		x = '/questions/'+x;
		window.location = x;
		return false;
	},
}).data("ui-autocomplete")._renderItem  = function( ul, item ) {
var x='',y='',i = 0;
x = item.id;
y = item.text;
  return $( "<li></li>" )
    .attr( "data-value", item.id )
    .append(y)
    .appendTo(ul);
};

	});
});
 
