function _map(list, mapper){
    var new_list = [];

    list.forEach(ele => {
        new_list.push(mapper(ele));
    });
    
    return new_list;
}

function _filter(list, predi){
	var new_list = [];
	
	list.forEach(ele => {
		if(predi(ele)) return;
		new_list.push(ele);
	});
	
	return new_list;
}

function isType(list, type){
	for ( var counter = 0; counter < list.length; counter++ ) {
		return list[counter][type];
	};
	return false;
}

function returnChange(rtn){
	if(rtn) return false;
	return true;
}

function getDisplay(ele) {
	if( ele == "block") return true;
}
function multiOnclicks(ele, fuc) {
	for(i=0; i<ele.length; i++){
		ele[i].onclick = () =>{
			fuc();
		};
	}
}
// class Alarm {
// 	constructor() {
// 		this.deleteMenu =  document.querySelector("#delete-menu");
// 		this.subMenu = document.querySelector("#sub-menu");
// 		this.cancelMenu = document.querySelector("#cancel-menu");
// 		this.deleteCheck = document.querySelectorAll(".delete-check");
// 		this.subBox = document.querySelector("#sub-box");
// 		this.switchItem = document.querySelector(".switch-item");
// 	}
// }


function AlarmSelector(){
	var element = {
		subMenu : document.querySelector("#sub-menu"),
		cancelMenu : document.querySelector("#cancel-menu"),
		deleteMenu : document.querySelector("#delete-menu"),
		deleteCheck : document.querySelectorAll(".delete-check"),
		deleteForm : document.querySelector("#delete-form"),
		updateForm : document.querySelector("#update-form"),
		subBox : document.querySelector("#sub-box"),
		switchItem : document.querySelectorAll(".switch-item"),
	};
	
	return element;
}

var ele = null;
function moveDetail(element){
	if(element.id == undefined) return;
	location.href = "detail?id="+element.id+"&type=list";
}

function updateAlram(element){
	var id = element.value;
	if(id == undefined) return;

	var flag = "N";

	if( element.checked ) flag = "Y";

	var params = "id=" + id + "&flag=" + flag;

     $.ajax({      
        type:"POST",
        dataType: "text",
        async: false,
        url:"updateAlarm",      
        data:params,      
        success:function(s){
        },   
        error:function(e){}  
	});  
	
	event.stopPropagation();
}

function deleteCourse(){
	if(ele == null) return;
	
	// 만약 체크값이 하나도 있다면
	if( isType(ele.deleteCheck, "checked") ) $(ele.deleteForm).submit();
}

function showDelete(){
	// show delete 버튼을 누르면 onclick 속성을 바꿔야 한다.
	//var ele = new Alarm();
	ele = AlarmSelector();
	$(ele.deleteCheck).show(200);
	$(ele.subMenu).hide();//속성 바꿔라
	$(ele.deleteMenu).hide();// 지금 추가

	$(ele.subMenu).attr('class','tr-menu').show(200);//속성 바꿔라
		
	$(ele.subBox).hide();
	
	$(ele.switchItem).hide(200); // 스위치 버튼 숨기기 //23
	
	// 이벤트를 바꿔준다.list-record
//	$(".list-item").off();
//
//	//$(".list-record").on("click", (()=> { deleteCheck(this); }));
//	
//	$(ele.deleteMenu).off().on("click", (()=> { deleteCourse(); }));
//
//	$(ele.cancelMenu).off().on("click",(()=>{ rollback(); }));
	
}

function hideDelete(){
	$(ele.deleteCheck).hide(200);
	$(".switch-item").show(200);
	$(ele.subBox).show(200);

	$(ele.deleteMenu).show();
	$(ele.deleteCheck).prop("checked", false);
}

// delete 체크하는 함수
function deleteCheck(){
	//element의 check박스를 빼던가 하자.
	var input = null;
	var currentTarget = event.currentTarget;
	if( currentTarget.tagName == "INPUT" && currentTarget.type == "checkbox") {
		input = event.target;
	} else {
		input = currentTarget.querySelector("input[type=checkbox]");
		input.checked = returnChange(input.checked);
	}

	if(input == null) return;
	
	var list  = ele.deleteCheck;
	if( isType(list, "checked") ) {
		$(ele.deleteMenu).show().css({"display" : "inline-block"})
	} else {
		$(ele.deleteMenu).hide(); //삭제 버튼
	}
}