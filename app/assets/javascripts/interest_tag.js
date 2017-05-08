function other_function2(item,address)
{
var dat = [];
var x;
$.ajaxSetup({
async: false
});
$.getJSON(address,function(data){
	$.each(data,function(index,element){
	dat.push({id: element.id, text: element.text});
	});
	}); 
return dat;
}


//function interest_token_function(){
$(document).on('turbolinks:load',function(){	
$('#interestmodal-window').on('show.bs.modal',function(){
	$("#interest_tokens").select2({
		multiple: true,
		placeholder: "select your interests",
		ajax: {
		data: function(term,page){
			return{
				term: term,
				page: page
			};
		},
		dataType: "json",
		quietMillis: 100,
		results: function(data,page){
			return{results: data
		}
		},
		url: $("#interest_tokens").data('url')
		},
		initSelection: function(item,callback){
  	var address  = $(item).attr('data-prepopulate');
  	var data = other_function2(item,address);
  				return callback(data);
  				},
		createSearchChoice: function(term,data){
			if($(data).filter(function(){
			return this.text.localeCompare(term)===0;
			}).length===0){
					//return false;//
					return {
				 id: "<<<" + term+ ">>>",
				 text: term
			  };
				}
			}
		}).on('select2-selecting',function(e){
var address  = $('#interest_tokens').attr('data-add');
var value = e.choice.id;
$.post(address,{interest: value});
}).on('select2-removing',function(e){
var address  = $('#interest_tokens').attr('data-remove');
var value = e.choice.id;
$.post(address,{interest: value});
})
.select2('val',[]);
		});
		});
