$(document).on('turbolinks:load', function() {
	$("#search_bar").autocomplete({
	//source: ['foo','food','for','something']
	source: "/search_products",
	select: function(event,ui){
		var x='',y='',i = 0;
		for(i = 0;i<ui.item.label.length;i++)
		if(ui.item.label[i]==',')
		break;
		else
		x = x+ui.item.label[i];
		y = ui.item.label.substr(i+1);
		x= "/users/"+x;
		window.location = x;
		return false;
	},
}).data("ui-autocomplete")._renderItem  = function( ul, item ) {
var x='',y='',i = 0;
	for(i = 0;i<item.label.length;i++)
	if(item.label[i]==',')
	break;
	else
	x = x+item.label[i];
	y = item.label.substr(i+1);
  return $( "<li></li>" )
    .attr( "data-value", item.value )
    .append(y)
    .appendTo( ul );
};

});
 
