$(document).ready(function(e) {
    $('.flip').live('click',function(){
		$(this).next().slideToggle('slow');
	});
});