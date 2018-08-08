var makeRequest =  function(method, url) {
    var httpRequest = new XMLHttpRequest();
    if(!httpRequest) return false;

    httpRequest.open(method, url, false);
    httpRequest.send();
    
    if(httpRequest.status === 200) return httpRequest;
};
window.addEventListener("load", function(){
    var main = document.querySelector("#main");
    function sendData(){
        const fd = new FormData(frm);
        const xhr = new XMLHttpRequest();

        var urlEncodedData = "";
        var urlEncodedDataPairs = [];
        
        for(let i = 0; i<frm.elements.length; i++){
            if(frm.elements[i].type == "submit") break;
            var name = frm.elements[i].name;
            var val  = frm.elements[i].value;

            urlEncodedDataPairs.push(encodeURIComponent(name) + '=' + encodeURIComponent(val));

        }
        urlEncodedData = urlEncodedDataPairs.join('&').replace(/%20/g, '+');
        

        var data;
        xhr.addEventListener("load", e => {
            data = e.target;
            if(data.responseText != "false" && data.responseURL != "") {
                location.href =  data.responseURL;
            }
        });
        
        xhr.addEventListener("error", e => {
            data = e;
            console.log(e);
        });

        xhr.open("POST", frm.action,false);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send(urlEncodedData);

        return data;
    }

    var frm = document.querySelector("#login-form");
    var logo = document.querySelector(".logo");
    
    frm.addEventListener("submit", function (event) {
        event.preventDefault();
        var data = sendData();
        
        if(data.responseText != "false") return;

        main.querySelector(".login-msg").textContent = "아이디가 없거나 비밀번호가 틀렸습니다.";
        
        logo.classList.add("on");
        // logo.addEventListener("transitionend", function(event) {
        //     logo.classList.remove("on");
        // }, false);  
        
        
        setTimeout(() => {
            logo.classList.remove("on");
        }, 400);


    });
});