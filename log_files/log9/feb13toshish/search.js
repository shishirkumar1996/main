$(document).on('turbolinks:load', function() {
  $("#click").click(function() {
  	$(this).hide();
  	$("#box").focus();
  });

  $("#box").on("focus", function() {
  	$("#click").hide();
  });
  $("#box").on("blur", function() {
  	setTimeout(function(){$('#click').show();}, 400);
  });
});
