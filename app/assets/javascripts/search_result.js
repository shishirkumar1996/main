//$(function() {
$(document).on('turbolinks:load',function(){
	$('#searchbar_button').attr('disabled',true);

$("#term").on("focus", function() {

$(document).on('keyup',function(){
if($("#term").val().length < 4)
	$('#searchbar_button').attr('disabled',true);
else
	$('#searchbar_button').attr('disabled',false);

});


var e = document.getElementById("options");
	
	$("#term").autocomplete({
	//source: ['foo','food','for','something']
	//source: "/search_products",      this is the earlier function
	
	source: function(request,response){
		$.ajax({
			url: '/search_products',
			dataType: 'json',
			data: {
				term: request.term,
				options: e.options[e.selectedIndex].text
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
		if(ui.item.type == 'user')
		x= "/users/"+x;
		else
		if(ui.item.type=='domain')
			x = '/domains/'+x;
		if(ui.item.type == 'article')
		x = '/articles/'+x;
		else
		if(ui.item.type == 'question')
		x = '/questions/'+x;
		window.location = x;
		return false;
	},
}).data("ui-autocomplete")._renderItem  = function( ul, item ) {
var x='',y='',i = 0;
//	for(i = 0;i<item.label.length;i++)
//	if(item.label[i]==',')
//	break;
//	else
//	x = x+item.label[i];
//	y = item.label.substr(i+1);
x = item.id;
y = item.text;
if(item.type=='user'||item.type=='domain')
{
		return $( "<li></li>" )
    .attr( "data-value", item.id )
    .append("<img src = "+item.image_address+">")
    .append(y)
    .appendTo(ul);
}
else
 {
  return $( "<li></li>" )
    .attr( "data-value", item.id )
    .append(y)
    .appendTo(ul);
	}

};
});
});
 
