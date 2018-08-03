window.addEventListener("load", function(){

    var cancelBtn = document.querySelector(".cancel-btn");
    var checkBtn = document.querySelector(".check-btn");
    var title = document.querySelector(".title");
    var updateForm = document.querySelector("#update-form");
    
    cancelBtn.onclick = function(){
        updateForm.submit();
    }

    title.onclick = function(){
        updateForm.submit();
    }

    checkBtn.onclick = function(){
        var updateForm = document.querySelector("#update-form");
        var alertSetting = document.querySelector("#alert-setting");
        var timeSetting = document.querySelector("#time-setting");

        var startingTime = timeSetting.querySelector(".starting-time").value;
        var endingTime = timeSetting.querySelector(".ending-time").value;
        var week = timeSetting.querySelector("#week-input").value;

        var startingAlarm = "N";
        var endingAlarm = "N"

        if(alertSetting.querySelector(".starting-alarm").checked){
            startingAlarm = "Y"; 
        }
        if(alertSetting.querySelector(".ending-alarm").checked){
            endingAlarm = "Y";
        }

        updateForm.querySelector("input[name=startingTime]").value = startingTime;
        updateForm.querySelector("input[name=endingTime]").value=endingTime;
        updateForm.querySelector("input[name=startingAlarm]").value=startingAlarm;
        updateForm.querySelector("input[name=endingAlarm]").value=endingAlarm;
        updateForm.querySelector("input[name=week]").value=week;

        updateForm.submit();
    }

});

window.addEventListener("load", function(){

    $(".td-input").timeDropper({
        setCurrentTime: false, 
        format: 'HH:mm'
    });

});
