$(function(){
    var status;
    $.get('/get_status',function(data){
	status = data;
    });
    while(status != 100) {
	animate_progress_bar();
	$.get('/get_status',function(data){
            status = data;
	});
    }
});

function animate_progress_bar() {
    console.info("calling animate_progress_bar()")
    $('#progress_bar').each(function(){
	$(this).animate(
	    {
		width: $(this).width() * 2
	    },
	    2000
	);
    });
}