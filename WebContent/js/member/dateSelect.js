$(function() {
	var datepicker = $("#datepicker");
	var weekSelect = function(s){
		
		var select = document.getElementById("week-select");
		var input = document.getElementById("week-input");
		
		if( s.className == "on") s.classList.remove("on");
		else s.classList.add("on");
		
		input.value = "";
		if(select.children.length <= 0 ) return;
		
		for(i=0; i<select.children.length; i++)
			if(select.children[i].className == "on")
				input.value += ","+select.children[i].textContent;

		input.value = input.value.substring(1);
	};
	
	$( ".time-dropper" ).timeDropper({
		setCurrentTime:false,
		meridians:true,
		format:'HH:mm'
	});
	
	$("#week-select li").click(function(){
		weekSelect(this);
		var week = $("#week-input").val();
		
		if(week == "") week = "-";
		$(".date-txt").text(week);
		
		datepicker.val("");
	});
	
	
	$("#datepicker-button").click(function(){
		$.datepicker.setDefaults({
			dateFormat: 'yy-mm',
			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			showMonthAfterYear: true,
			yearSuffix: '년'
		});
		datepicker.datepicker("show");
	});
	
	datepicker.datepicker({
	    dateFormat: 'yy-mm-dd',
    	onSelect: function(dateText) {
            $(".date-txt").text(dateText);
            $("#week-select li").removeClass("on");
            $("#week-input").val("");
        },
        beforeShow: function (event) {
            setTimeout(function () {  }, 5);               
        }
	});

});