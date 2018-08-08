//window.addEventListener("load", function(){ 
//
//	var sel = AlarmSelector();
//	var listRecord = document.querySelectorAll(".list-record");
//	multiOnclicks(listRecord, ()=>{
//			if(getDisplay(sel.subMenu.style.display)) {
//				deleteCheck();
//			} else {
//				if( event.target.classList[0] == "slider" ) return;
//				moveDetail(event.currentTarget);
//			}
//		}
//	);
//	
//	sel.subBox.onclick = () => { showDelete(); };
//	sel.cancelMenu.onclick = () => { hideDelete(); };
//	sel.deleteMenu.onclick = () => { deletData() };
//	multiOnclicks(sel.deleteCheck, ()=>{ deleteCheck(event.target); } ); 
//
//	var alarms = document.querySelectorAll(".alarm");
//	multiOnclicks(alarms, ()=>{ updateAlram(event.target); } ); 
//	
//});


window.addEventListener("load", function(){ 

	var sel = AlarmSelector();
	var list = document.querySelector(".sel-list");
	list.onclick = function(e){
		//LI찾기
		var el = e.target;
		if(el.nodeName == "SECTION") return;
		for(; el.nodeName != "LI"; el = el.parentElement);
		if(e.target.nodeName == "INPUT" && e.target.classList.contains("alarm")) return;

		if(e.target.classList.contains("slider") && e.target.nodeName == "SPAN" ) {
			var input = el.querySelector("input.alarm");
			updateAlram(input);
			return;
		};

		//LI변경
		if( el.classList.contains("list-record") ){
			if(sel.subMenu.style.display == "block") {
				deleteCheck();
			} else {
				moveDetail(el);
			}
		} 
	}
	
	
	//menuShowChk
	sel.subBox.onclick = function() { showDelete(); };
	sel.cancelMenu.onclick = function() { hideDelete(); };
	sel.deleteMenu.onclick = function() { deletData() };
	
});