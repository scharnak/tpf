    $(document).ready(function() {
        $('#employee_group').hide();
        $('#employee_btn').click(function() {
        	var txt = $('#employee_group').is(':visible') ? 'Yes' : 'No'
        	$("#employee_btn").text(txt);
        	$('#employee_group').slideToggle();
        })
    });