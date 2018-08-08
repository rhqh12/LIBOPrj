/*!
* WebRTC Lab 
* @author dodortus (codejs.co.kr / dodortus@gmail.com)
*/
var recognition = new webkitSpeechRecognition();
var isRecognizing = false;
var ignoreOnend = false;
var finalTranscript = '';
var audio = document.getElementById('audio');
var $btnMic = $('#btn-mic');
var $result = $('#result');
var $iconMusic = $('#icon-music');
recognition.continuous = true;
recognition.interimResults = true;

recognition.onstart = function() {
  isRecognizing = true;

  $btnMic.attr('class', 'on');
};

recognition.onend = function() {
  console.log('onend', arguments);
  isRecognizing = false;

  if (ignoreOnend) {
    return false;
  }

  // DO end process
  $btnMic.attr('class', 'off');
  if (!finalTranscript) {
    console.log('empty finalTranscript');
    return false;
  }

  if (window.getSelection) {
    window.getSelection().removeAllRanges();
    var range = document.createRange();
    range.selectNode(document.getElementById('final-span'));
    window.getSelection().addRange(range);
  }
};

recognition.onresult = function(event) {
  console.log('onresult', event);

  var interimTranscript = '';
  if (typeof(event.results) == 'undefined') {
    recognition.onend = null;
    recognition.stop();
    return;
  }

  for (var i = event.resultIndex; i < event.results.length; ++i) {
    if (event.results[i].isFinal) {
      finalTranscript += event.results[i][0].transcript;
    } else {
      interimTranscript += event.results[i][0].transcript;
    }
  }

  finalTranscript = capitalize(finalTranscript);
  final_span.innerHTML = linebreak(finalTranscript);
  interim_span.innerHTML = linebreak(interimTranscript);

  console.log('finalTranscript', finalTranscript);
  console.log('interimTranscript', interimTranscript);
  fireCommand(interimTranscript);
};

function fireCommand(string) {
  if (string.endsWith('알람')) {
    location.href ="/LiboPrj/member/alert/list";
  } else if (string.endsWith('경로') || string.endsWith('종로')) {
    location.href ="/LiboPrj/member/course/list";
  } else if (string.endsWith('설정')) {
    location.href ="/LiboPrj/member/menu/set/list";
  } else if (string.endsWith('메인')) {
    location.href ="/LiboPrj/member/";
  } else if (string.endsWith('노래 켜') || string.endsWith('음악 켜')) {
    audio.play();
    $iconMusic.addClass('visible');
  } else if (string.endsWith('노래 꺼') || string.endsWith('음악 꺼')) {
    audio.pause();
    $iconMusic.removeClass('visible');
  } else if (string.endsWith('볼륨 업') || string.endsWith('볼륨업')) {
    audio.volume += 0.2;
  } else if (string.endsWith('볼륨 다운') || string.endsWith('볼륨다운')) {
    audio.volume -= 0.2;
  } else if (string.endsWith('스피치') || string.endsWith('말해줘') || string.endsWith('말 해 줘')) {
    textToSpeech($('#final_span').text() || '전 음성 인식된 글자를 읽습니다.');
  }
}

recognition.onerror = function(event) {
  if (event.error == 'no-speech') {
    ignoreOnend = true;
  } else if (event.error == 'audio-capture') {
    ignoreOnend = true;
  } else if (event.error == 'not-allowed') {
    ignoreOnend = true;
  }

  $btnMic.attr('class', 'off');
};

var two_line = /\n\n/g;
var one_line = /\n/g;
var first_char = /\S/;

function linebreak(s) {
  return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
}

function capitalize(s) {
  return s.replace(first_char, function(m) {
    return m.toUpperCase();
  });
}

function start(event) {
  console.log(event);
  if (isRecognizing) {
    recognition.stop();
    return;
  }
  recognition.lang = 'ko-KR';
  recognition.start();
  ignoreOnend = false;

  finalTranscript = '';
  final_span.innerHTML = '';
  interim_span.innerHTML = '';

}

/**
 * textToSpeech
 * 지원: 크롬, 사파리, 오페라, 엣지
 */
function textToSpeech(text) {
	console.log(text);
	speechSynthesis.speak(new SpeechSynthesisUtterance(text));  
}

$(function() {
  if (typeof webkitSpeechRecognition != 'function') {
    alert('리보 음성 서비스는 크롬에서만 동작 합니다.');
    return false;
  }
  /**
   * init
   */
  $btnMic.click(start);

  $('#btn-tts').click(function() {
    textToSpeech($('#final_span').text() || "안녕하세요? ありがとうございます. Hello. 你好. señor blanco, ¿qué estudia usted?");
  });
});
