function other_function(item){
var data = [];
var x = $(item).attr('data-load');
//alert(x);
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

function token_function(){
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
 // initSelection: function(item,callback){
  //	var data,id,text;
 // 	id = item.val();
  //	text = item.data('load');
 // 	data = other_function(item);
 // 				return callback(data);
  	//			},
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
}).select2('val',[]);

}

$(document).ready(function() {
/*	
$("#user_tokens").on('click',function(){
//alert('something');
var x = $('#user_tokens').attr('data-load');
alert(x);
for( var key in x){
	if(x.hasOwnProperty(key)){
	var val = x[key];
	alert(val);
	}}

//alert(x+'something');
});
*/


/*$.fn.select2.amd.require([
  'select2/data/array',
  'select2/utils'
], function (ArrayData, Utils) {
  function CustomData ($element, options) {
    CustomData.__super__.constructor.call(this, $element, options);
  }

  Utils.Extend(CustomData, ArrayData);
  CustomData.prototype.current = function (callback) {
    var data = [];
    var currentVal = this.$element.val();

    if (!this.$element.prop('multiple')) {
      currentVal = [currentVal];
    }

    for (var v = 0; v < currentVal.length; v++) {
      data.push({
        id: currentVal[v],
        text: currentVal[v]
      });
    }

    callback(data);
  };

	$("#user_tokens").select2({
  multiple: true,
  tags: true,
  placeholder: "select an option",
  dataAdapter: CustomData,
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
//  initSelection: function(item,callback){
  //	var data,id,text;
  	//id = item.val();
  //	text = item.data('load');
  	//	data = {id: id,
  		//			text: text
  			//	};
  			//	return callback({id: 4, text: 'Text'});
  	//			},
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
});

})
*/

	});
