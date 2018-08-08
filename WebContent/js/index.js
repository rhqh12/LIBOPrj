window.addEventListener("load", function(){
    if (typeof webkitSpeechRecognition != 'function') {
      return false;
    }
    var txt = document.querySelector(".txt");
    var data = [
    	{txt:"안녕하세요?", voice:"안녕하세요!"},
        {txt:"Hello?", voice:"Hello!"},
        {txt:"ゴンニチと", voice:"곤니찌와!"},
        {txt:"你好", voice:"니하오!"},
        {txt:"Hola!", voice:"올라!"},
        {txt:"만나서 반갑습니다.",reset:1,s:1100},
        {txt:"언제나 당신과 함께하는",reset:1,s:1200},
        {txt:"리보입니다.",reset:1}
    ];
    var exSpeech = function(el, data, idx){
        var span = document.createElement("span");
        var obj = data;
        span.innerText = obj.txt;
        
        if(obj.reset == 1) el.innerHTML = "";

        el.appendChild(span);
        
        var voice = obj.txt;
        if(obj.voice != null) voice = obj.voice;
        textToSpeech(voice);
    };

	var init = function(){
        var speed = 1000;
        var allSpeed = 0;
        data.forEach(function(obj,index,collection) {
            console.log(speed);
            setTimeout(function(){
                exSpeech(txt, obj);
            }, index * speed);
            if(obj.s) speed = obj.s;
            allSpeed += speed;
            if(index+1 == collection.length) {
                console.log(allSpeed);
                setTimeout(() => {
                    location.href = "./member/login";
                }, allSpeed + 1500);    
            }
        });
    };
    init();
});