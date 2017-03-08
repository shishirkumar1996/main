$(document).on('turbolinks:load', function() {

  $("#search_bar").on("focus", function() {
  	$("#headerright").hide();
  });
  $("#search_bar").on("blur", function() {
  	setTimeout(function(){$('#headerright').show();}, 400);
  });
});
