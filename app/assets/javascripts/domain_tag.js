function domain_token_function(){
	$("#domain_tokens").select2({
		multiple: true,
		placeholder: "select the domains",
		ajax:{
			data: function(term,page){
				return{
					term: term,
					page: page
				};
			},
			dataType: "json",
			quietMillis: 100,
			results: function(data,page){
				return {results: data
			}
			},
			url: $("#domain_tokens").data('url')
			},
			createSearchChoice: function(term,data){
				if ($(data).filter(function(){
					return this.text.localeCompare(term)===0;
					}).length===0){
					//return false;//
					return {
				 id: "<<<" + term+ ">>>",
				 text: term
			  };
				}
			}
		}).select2('val',[]);
		}
				
