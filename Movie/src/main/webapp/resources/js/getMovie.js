//아이콘 바꿔 별점주기 start
const addStar = function (target) { // hidden  처리된 input에 값이 들어올 시 이벤트 처리 메서드를 변수에 저장한다(매개값 : this) 
document.querySelector(`.starAdd span`).style.width = `${target.value * 20}%`; // 요소의 클래스네임이 star 안의 span 태그의 css 속성을 주고 너비는 hidden된 input의 값 x 20%를 너비로 준다
// 두개의 별5개를 포지션상으로 겹친 후, 색이들어올 별5개의 초기값은 너비가 0이고 input의 값 x 20% 만큼씩 누르면 배경색이 채워지면 반개씩 별을 채운다
var targetValue = document.getElementById("inputs").value; // targetValue : hidden된 input의 값을 변수에 담는다
document.getElementById("scores").innerText = targetValue; // className이 print인 태그안의 className이 score인 요소의 text를 값을 담은 변수 targetValue를 넣는다.
var valInput = document.getElementById("scores").innerText;
document.getElementById("starVal").value = valInput;
console.log(starVal.value);
} 


$(document).ready(function(){
	/*
	$("#commentBtn").on("click", (e) => {
		e.preventDefault();
	var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
	var csrfTokenValue = $("meta[name='_csrf']").attr("content");
	
	//var formData = document.querySelector("form[role='form']");
	var formData ={};
	$('form[role="form"] input').each(function(index, element) {
        formData[element.name] = element.value;
    });
    $('form[role="form"] textarea').each(function(index, element) {
        formData[element.name] = element.value;
    });
	console.log(formData);
	$.ajax({
		type: 'POST',
		url: "/regComment",
		processData: false,
		contentType: "application/json",
		beforeSend: function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
		data:  JSON.stringify(formData),
		dataType: "application/json",
		success: function(result){
			console.log(result);
			alert("success!")
			},
		error:function(result){
			console.log(result);
			alert("fail!");
			}
		
			
		});
	
	});
*/

	$("#commentBtn").on("click", (e) => {
	    e.preventDefault();
	    var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
	    var csrfTokenValue = $("meta[name='_csrf']").attr("content");
	
	    var formData = $("form[role='form']").serialize(); // 직렬화된 폼 데이터를 가져옴
	
	    console.log(formData);
	    $.ajax({
	        type: 'POST',
	        url: "/regComment",
	        beforeSend: function(xhr){
	            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	        },
	        data: formData, // 직렬화된 폼 데이터를 전송
	        success: function(result){
	            console.log(result);
	            alert("success!")
	            window.location.reload(true);
	        },
	        error:function(result){
	            console.log(result);
	            alert("fail!");
	        }
	    });
	});

});// .document.ready