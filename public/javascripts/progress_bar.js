var status
var animation_timer
$(function(){
     animation_timer = setInterval(get_status_and_animate,1000);
});

function get_status_and_animate(){
    $.get('/get_status',function(data){
	 status = data;
    });
    if(status == 100) {
	console.info("going to call clearInterval");
	clearInterval(animation_timer);
	window.location="/results";
    }
    console.info("calling animate function with status:"+status)
    animate_progress_bar();    
}
function animate_progress_bar() {
    console.info("calling animate_progress_bar()")
    $('#progress_bar').each(function(){
	$(this).animate(
	    {
		width: $(this).width() + 10
	    },
	    500
	);
    });
}