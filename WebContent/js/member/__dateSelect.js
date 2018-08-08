$(function() {
	var datepicker = document.querySelector(".datepicker");

	$("#time-dropper").timeDropper({
		setCurrentTime:false,
		meridians:true
	});

	var weekSelector = document.querySelectorAll("#week-select li");
	weekSelector.onclick = function(t){
		var week = document.querySelector("#week-input");
		var val = week.value;

		weekSelect(obj = [
					{li:t},
					{select:weekSelector},
					{input:week}
				]);
		
		if(val == "") val = "-";
		
		document.querySelector(".date-txt").textContent = val;
		datepicker.value = "";
	};

	var weekSelectEvent = ((obj)=>{
		var li = obj.li;
		var select = obj.select;
		var input = obj.input;
		
		if(li.className == "on") li.classList.remove("on");
		else li.classList.add("on");
		
		input.value = "";
		if(select.children.length <= 0) return;
		
		for(i=0; i<select.children.length; i++){
			if(select.children[i].className == "on")
				input.value += ","+select.children[i].textContent;
		}
		
			
		input.value = input.value.substring(1);	
	});

	var datepickerButton = document.querySelector("#datepicker-button");
	$(datepicker).click(function(){
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

	$(datepicker).datepicker({
		dateFormat: 'yy-mm-dd',
		onSelect: function(dateText) {
			document.querySelector(".date-txt").textContent = dateText;
		},
		beforeShow: function (event) {
			setTimeout(function () {  }, 5);               
		}
	});	
});
