window.addEventListener("load", function(){
	
    var alertSetting = document.querySelector("#alert-setting");
    var buttonBox = document.querySelector("#button-box");
    var cancelBtn =  buttonBox.querySelector(".cancel-btn");
    var checkBtn = buttonBox.querySelector(".check-btn");
    // 안녕하세요 반갑습니다.
    cancelBtn.onclick = function(){
    	location.href="list";
    };
    
    checkBtn.onclick = function(){
    	location.href="list";
    };
    
    alertSetting.onclick = function(e){
        e.preventDefault();
        var el = e.target;
        var eln = el.nodeName;
        if(eln != "SPAN" && eln != "INPUT")
            return;
        if(eln == "SPAN")
            el = el.previousElementSibling;   
        var swList = alertSetting.querySelectorAll(".switch input");
        swList.forEach(function(item){
        	item.checked = false;
            if(el === item)
            	item.checked = true;                
        }); 
    };
});