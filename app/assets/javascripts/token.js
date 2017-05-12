function some_other_function(item){
var data = [];
var x = $(item).attr('data-load');
alert(x);
var i = 0;
while(i<x.length)
{
var z = '';
while(x[i]=='['||x[i]=='\"')
i++;
var val = '';
while(x[i]!='+')
val = val+x[i],i++;
i++;
while(x[i]!= '\"')
z = z+x[i],i++;
i++,i++;
//alert(val+','+z);
data.push({id: val,text: z});

}
return data;
}

function other_function(item,address)
{
alert(address);
var dat = [];
var x;
$.ajaxSetup({
async: false
});
$.getJSON(address,function(data){
	$.each(data,function(index,element){
	//alert(element.text);
	dat.push({id: element.id, text: element.text});
	});
	}); 
return dat;
}


