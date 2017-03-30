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


function user_token_function(){
$("#user_tokens").select2({
  multiple: true,
  tags: true,
  placeholder: "select an option",
  //dataAdapter: CustomData,
 	ajax:{
  data: function(term,page){
  	return{
  			term: term,
  			page: page
  		};
  },
  dataType: "json",
  quietMillis: 100,
  results: function(data,page) {
  	return {results: data
  }
  },
  url: $("#user_tokens").data('url')
  },
  initSelection: function(item,callback){
  	//var id,text;
  	//id = item.val();
  	//text = item.data('prepopulate');
  	//alert(id);
  	//alert(text);
  	var address  = $(item).attr('data-prepopulate');
  	var data = other_function(item,address);
  				return callback(data);
  				},
  createSearchChoice: function(term, data) {
    if ($(data).filter(function() {
      return this.text.localeCompare(term) === 0;
    }).length === 0) {
      return false;//{
     
     //   id: "<<<" + term + ">>>",
       // text: term
     // };
    }
  }
})//.on('select2-selecting',function(e){
//alert(e.choice.text);
//alert(e.val);
//})
.select2('val',[]);


}

