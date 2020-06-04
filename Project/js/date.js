/*Date*/
$(function() {
  $( ".calendar" ).datepicker({
		dateFormat: 'yy-mm-dd',
		firstDay: 1
	});

	$(document).on('click', '.xdate-picker .input', function(e){
		var $me = $(this),
		$parent = $me.parents('.xdate-picker');
		$parent.toggleClass('open');
	});


	$(".calendar").on("change",function(){
		var $me = $(this),
				$selected = $me.val(),
				$parent = $me.parents('.xdate-picker');
		$parent.find('.result').children('span').html($selected);
    $parent.find('.result').children('input').val($selected);
    $parent.find('.result').css('color','#fff').css('background','#6081f7');

    $parent.removeClass('open');

	});
});
