window.addEventListener("load", function(){ 

	var sel = AlarmSelector();
	var listRecord = document.querySelectorAll(".list-record");
	multiOnclicks(listRecord, ()=>{
			if(getDisplay(sel.subMenu.style.display)) {
				deleteCheck();
			} else {
				if( event.target.classList[0] == "slider" ) return;
				moveDetail(event.currentTarget);
			}
		}
	);
	
	sel.subBox.onclick = () => { showDelete(); };
	sel.cancelMenu.onclick = () => { hideDelete(); };
	sel.deleteMenu.onclick = () => { deletData() };
	multiOnclicks(sel.deleteCheck, ()=>{ deleteCheck(event.target); } ); 

	var alarms = document.querySelectorAll(".alarm");
	multiOnclicks(alarms, ()=>{ updateAlram(event.target); } ); 
	
});