$(document).ready(function() {
  
	$("#ajax").submit(function(event){
		
		event.preventDefault();

		$('img').show();

		$.ajax({
			url: '/ajax_tweets',
			method: 'POST',
			dataType: "json",
			data: $(this).serialize()
		}).done(function(response){
			
			$.each(response, function(index, value){
				$('img').hide();
				$('.tweets').append(
					'<p>\
					<dt>'+value["text"]+'</dt>\
   					<dd> posted on '+value["text_created_at"]+'</dd>\
   					</p>'
					)
			})
		})
	})

});
