function makeRequest(method, url) {
    var httpRequest = new XMLHttpRequest();
    if(!httpRequest) return false;

    httpRequest.open(method, url, false);
    httpRequest.send();
    
    if(httpRequest.status === 200) return httpRequest;
}