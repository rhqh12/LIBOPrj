window.addEventListener("load", function(){

    var timeInfo = document.querySelector("#time-info");
    var updateForm = document.querySelector("#update-form");

    timeInfo.onclick = function(){
        updateForm.action = "updateDate";
        updateForm.method = "post";
        updateForm.submit();
    }

});

window.addEventListener("load", function(){
 
    var courseSetting = document.querySelector("#course-setting");
    var homeTr = courseSetting.querySelector("table tr:first-child");
    var workTr = courseSetting.querySelector("table tr:last-child");
    var updateForm = document.querySelector("#update-form");
    homeTr.onclick = function(){ 
        updateForm.action = "address";
        updateForm.querySelector("input[name=type]").value="workplace";
        updateForm.submit();
    }

    workTr.onclick = function(){
        updateForm.action = "address";
        updateForm.querySelector("input[name=type]").value="home";
        updateForm.submit();
    }


});

window.addEventListener("load", function(){
    var header = document.querySelector("#header");
    var saveMenu = header.querySelector(".save-menu");
    var updateForm = document.querySelector("#update-form");
    saveMenu.onclick = function(){
        updateForm.action = "update";
        updateForm.submit();
    }
});