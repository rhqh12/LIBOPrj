window.addEventListener("load", function(){
    var articeMain = document.querySelector("#main");
    var aside = articeMain.querySelector("#list-article");
    var el, scrollEvent = null;
    var pageNo = 1;
    aside.onclick = function(e){
        //el = event.target;
        var el = e.target;
        for(; el.nodeName != "ARTICLE"; el = el.parentElement) ;
        if(el.nodeName != "ARTICLE") return;
        var url = el.dataset["url"];
        
        
    }
    articeMain.onscroll = function() {
        el = event.target;
        if ((el.scrollTop + 30 < el.scrollHeight - el.clientHeight) || scrollEvent == "N")
            return;

        var makeDom = makeRequest("get", "?page="+pageNo++);
        if (typeof makeDom === "undefined") return scrollEvent = "N";
        
        var data = document.createElement("data");
        data.innerHTML = makeDom.responseText;
        var items = data.querySelectorAll("#list-article article");
        
        if(items.length <= 0) return scrollEvent = "N";

        items.forEach(item => {
            aside.appendChild(item.cloneNode(true));
        });
    }; 
});


function makeRequest(method, url) {
    var httpRequest = new XMLHttpRequest();
    if(!httpRequest) return false;
    
//    httpRequest.onreadystatechange = function(){
//        if (httpRequest.readyState === XMLHttpRequest.DONE) {
//            if (httpRequest.status !== 200) return false;
//        }        
//    }
    httpRequest.open(method, url, false);
    httpRequest.send();
    
    if(httpRequest.status === 200) return httpRequest;
//    httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
//    httpRequest.send('userName=' + encodeURIComponent(userName));
}