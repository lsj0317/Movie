// 스프링 시큐리티용
const csrfHeader = $("meta[name='_csrf_header']").attr("content");
const csrfToken = $("meta[name='_csrf']").attr("content");

function logout() {
    $.ajax({
        type: "POST",
        url: "/home", // 로그아웃 처리 URL
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		},
        success: function(response) {
            // 로그아웃 성공 시 동작
            console.log("로그아웃 성공");
            // 여기에서 원하는 추가 작업을 수행할 수 있습니다.
            // 예: 로그아웃 후 특정 페이지로 리다이렉트
            window.location.href = "/";
        },
        error: function(xhr, status, error) {
            // 로그아웃 실패 시 동작
            console.error("로그아웃 실패:", error);
            // 여기에서 실패한 경우에 대한 처리를 수행할 수 있습니다.
        }
    });
}

function getVideoSource(e){
	let videoSrc = "";
	console.log(e.value);
	let uri = e.value;
	if(uri.includes('https://youtu.be/')){
		let uris = uri.split("/");
		console.log(uris);
		let videoString = uris[uris.length-1];
		console.log(videoString);
		videoSrc = videoString.substring(0,videoString.indexOf('?'));
		console.log(videoSrc);
	} else if (uri.includes('https://www.youtube.com/watch?')){
		let uris = uri.split("/");
		console.log(uris);
		let videoString = uris[uris.length-1];
		console.log(videoString);
		videoSrc = videoString.substring(videoString.indexOf('=')+1,videoString.length);
		console.log(videoSrc);
	} else {
		alert("올바른 주소를 입력해주세요");
		return;
	}
	let videoViewer = document.getElementById("videoViewer");
	console.log(videoViewer);
	videoViewer.setAttribute("src",'https://www.youtube.com/embed/'+videoSrc);
	
}



function ripCheck(event) {
      // 사망년도 datePicker input 가져오기
      var ripDate = document.getElementById("date2");
      if(event.target.checked) {
         ripDate.disabled = false;
      }else {
         ripDate.disabled = true;
      }
}
   
   // 출생년도 선택하면 나이 입력되는 메서드
   function insertBirth() {
      // 오늘 날짜 구하기
      var dates = new Date();
      // 년도만 분리
      var years = dates.getFullYear();
      // 월만 분리
      var month = dates.getMonth();
      // 일자만 분리
      var date = dates.getDate();
      //console.log(String(dates));
      //console.log(String(years));
      // String 값으로 년도 치환
      var st_y = String(years);
      // String 값으로 달 치환
      var st_m = String(month);
      //console.log(String(month));
      // String 값으로 일자 치환
      var st_d = String(date);
      //console.log(String(date));
      // 포멧팅해서 변수에 저장
      var format = " year : " + st_y + " month :  " + st_m + " date : " + st_d;
      console.log(format);
      // input date(출생년-월-일)값 가져오기
      var birthday = document.querySelector("#date1").value;
      // 콘솔에 출력(input date(출생년-월-일)값 가져오기)
      console.log(birthday);
      // 출생년도만 자르기
      var strYMD = birthday.split("-");
      var strY = strYMD[0];
      console.log("자른 년도는 : " + strY);
      // 이번년도 - 출생년도 = 만나이
      var ages = years - strY;
      // 콘솔에 출력(이번년도 - 출생년도 = 만나이)
      console.log(ages); 
      // 나이칸 변수에 저장
      var Age = document.querySelector("#Age");
      // 계산한 나이 나이칸에 값 저장 및 출력
      console.log(Age);
      Age.value = ages;
   } 



// ver1 star
const checkStar = function(target) { // hidden  처리된 input에 값이 들어올 시 이벤트 처리 메서드를 변수에 저장한다(매개값 : this) 
	document.querySelector(`.star span`).style.width = `${target.value * 20}%`; // 요소의 클래스네임이 star 안의 span 태그의 css 속성을 주고 너비는 hidden된 input의 값 x 20%를 너비로 준다
	// 두개의 별5개를 포지션상으로 겹친 후, 색이들어올 별5개의 초기값은 너비가 0이고 input의 값 x 20% 만큼씩 누르면 배경색이 채워지면 반개씩 별을 채운다
	var targetValue = document.getElementById("inputVal").value; // targetValue : hidden된 input의 값을 변수에 담는다
	document.getElementById("score").innerText = targetValue; // className이 print인 태그안의 className이 score인 요소의 text를 값을 담은 변수 targetValue를 넣는다.
}

// ver2 star
/**
 *  (제이쿼리 메서드 설명)
 *  on()             : 이벤트를 받는 메서드 ex) on(이벤트, 동작할 메서드)
 *  css()            : HTML 태그에 CSS 속성을 부여한다 ex) css(속성명, 값)                                        
 *  $(this)          : 자기 자신을 선택한다
 *  index()          : 자기 자신의 순서를 찾는 제이쿼리 메서드
 *  addClass()       : HTML 태그에 className을 추가한다
 *  removeClass()    : HTML 태그에 className을 삭제한다
 *  prevAll()        : 선택한 요소의 이전의 요소들을 찾는다
 *  nextAll()        : 선택한 요소의 이후의 요소들을 찾는다
*/

$('.print .comment').css("color", "gray");          // 0점일 경우 comment의 color는 gray로 유지

$('.fa-star').on("click", function() {             // 별 아이콘을 누르면 동작한다
	$(this).addClass('active');                     // 별 아이콘을 누르면 누른별의 클래스가 적용된다
	$(this).prevAll().addClass('active');           // 누른 별 아이콘을 기준으로 이전의 별들의 클래스를 모두 적용한다 (점수 올리기)
	$(this).nextAll().removeClass('active');        // 누른 별 아이콘을 기준으로 이후의 별들의 클래스를 모두 삭제한다 (점수 내리기)

	var num = $(this).index();                      // 누른 별의 순서를 변수에 저장한다
	var sratRate = num + 1;                         // index는 0번 부터 시작이므로  num의 값에 1을 더해준다

	var strArr = ["별로에요ㅠ",                        // 변수에 점수에 맞는  comment를 배열로 저장한다
		"그저그래요..",
		"좋아요 :)",
		"아주좋아요^▽^",
		"최고에요>ㅁ<b"];

	$('.print .comment').css("color", "white");     // comment의 color는 white 변경

	switch (sratRate) {
		case 1:                                     // 1점일 경우
			$('.print .score').text(sratRate);      // 저장한 순서를 아래의 text의 span tag안에 값으로 넣는다
			$('.print .comment').text(strArr[0]);   // 변수(String)의 값의 배열 순서와 점수를 일치하는 것을 text에 넣는다
			break;
		case 2:                                     // 2점일 경우
			$('.print .score').text(sratRate);
			$('.print .comment').text(strArr[1]);
			break;
		case 3:                                     // 3점일 경우
			$('.print .score').text(sratRate);
			$('.print .comment').text(strArr[2]);
			break;
		case 4:                                     // 4점일 경우
			$('.print .score').text(sratRate);
			$('.print .comment').text(strArr[3]);
			break;
		case 5:                                     // 5점일 경우
			$('.print .score').text(sratRate);
			$('.print .comment').text(strArr[4]);
			break;
	}

});

// file upload drag 
const dropArea = document.getElementById("uploadedImages");		//이미지 드래그 드롭 필드 등록
var fileInput = document.getElementById("file-input");			//input type="file" 태그
const imagePreview = document.getElementById("image-preview");	
const dataTranster = new DataTransfer();						//데이터 전송용 객체
var uploadedImages = document.getElementById("uploadedImages");	//이미지 표시할 캐러셀
var uploadImageButton = document.getElementById("uploadImage");	//캐러셀 이미지 등록 버튼
var deleteImageButton = document.getElementById("deleteImage");	//캐러셀 이미지 삭제 버튼
//var formObj = document.querySelector("form");

if (!(uploadedImages == null)) {							//캐러셀이 없을 경우
	uploadedImages = uploadedImages.querySelector("div");	//이미지 드롭 필드 변경
}
const inputFile = $("input[name='uploadFile']");

function onClickFunction() {	//필드 클릭시 이미지 등록 이벤트 등록
	fileInput.click();
}

function createUploadFileInput(form) {  //폼을 받아 이미지 input태그를 폼에 삽입하는 메서드
	let nodes = document.querySelector("#uploadedImages").querySelectorAll("img");
	let inputString = "";
	$(nodes).each(function(i, obj) {
		let inputFileName = document.createElement("input");
		let inputFilePath = document.createElement("input");
		let inputFileUuid = document.createElement("input");
		inputFileName.type = "hidden";
		inputFileName.setAttribute('name', "imgList[" + i + "].fileName");
		inputFileName.setAttribute('value', obj.getAttribute("fileName"));
		inputFilePath.type = "hidden";
		inputFilePath.setAttribute('name', "imgList[" + i + "].uploadPath");
		inputFilePath.setAttribute('value', obj.getAttribute("uploadPath"));
		inputFileUuid.type = "hidden";
		inputFileUuid.setAttribute('name', "imgList[" + i + "].uuid");
		inputFileUuid.setAttribute('value', obj.getAttribute("uuid"));
		inputString += inputFileName.outerHTML+inputFilePath.outerHTML+inputFileUuid.outerHTML;
	});
	form.append(inputString).submit();
}

function createCarouselInner(fileList) {	//업로드된 이미지를 캐러셀에 등록
	let nodes = document.querySelector("#uploadedImages").querySelector("div").querySelectorAll("div");
	for (var i = 0; i < nodes.length; i++) {
		nodes[i].remove();
	};
	$(fileList).each(function(i, obj) {
		const carouselInner = document.createElement("div");	//div 태그 생성
		if (i == 0) {
			carouselInner.className = "carousel-item active";
		} else {
			carouselInner.className = "carousel-item";
		}
		const img = document.createElement("img");				//img 태그 생성
		var urlString = '/'+ window.location.pathname.split("/")[1];
		var fileCallPath = encodeURIComponent(urlString+"/"+obj.uploadPath.replaceAll('\\','/') + "/" + obj.uuid + "_" + obj.fileName);
		console.log(fileCallPath);
		img.src = "/download?fileName=" + fileCallPath;
		img.setAttribute('width', "100%");
		img.setAttribute('height', "auto");
		img.setAttribute('class', "d-block w-100");
		img.setAttribute('uploadPath', obj.uploadPath.replaceAll('\\','/'));
		img.setAttribute('uuid', obj.uuid);
		img.setAttribute('fileName', obj.fileName);				//img태그에 데이터 등록
		carouselInner.appendChild(img);							//img태그를 div에 등록
		uploadedImages.appendChild(carouselInner);				//완성된 div를 캐러셀에 등록
	});
	
	//createUploadFileInput(formObj);
	console.log(uploadedImages);
	dropArea.removeAttribute('eventList');						//이벤트 등록 정보 태그 삭제
	dropArea.removeEventListener("click", onClickFunction);		//캐러셀 클릭 이벤트 제거
	console.log("event remove");

	let nodeList = document.querySelector("#uploadedImages").querySelector("div").querySelectorAll("div");	//캐러셀 이너 div 선택
	console.log(nodeList);
	if (nodeList.length == 0) {																				//캐러셀 이너 div에 내용이 없을 경우 기본 이미지 등록
		var emptyNode = document.createElement("div");
		var emptyP = document.createElement("p");
		emptyNode.setAttribute("id", "drop-area");
		emptyNode.setAttribute("style", "width:100%;");
		emptyP.innerText = "이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.";
		emptyNode.appendChild(emptyP);
		document.querySelector("#uploadedImages").querySelector("div").appendChild(emptyNode);

		dropArea.setAttribute('eventList', 'click');														//클릭 이벤트 등록 정보 태그 생성
		dropArea.addEventListener("click", onClickFunction);												//클릭 이벤트 등록
		console.log("event set");
	}

};


if (!(dropArea == null)) {
	// 드래그 앤 드롭 이벤트 처리
	dropArea.addEventListener("dragover", (e) => {		//마우스 위치 이벤트 등록
		e.preventDefault();
		dropArea.style.backgroundColor = "#eee";
	});

	dropArea.addEventListener("dragleave", () => {		//마우스 위치 이벤트 등록
		dropArea.style.backgroundColor = "#fff";
	});

	dropArea.addEventListener("drop", (e) => {			//이미지 드롭 이벤트 등록
		const dataTranster = new DataTransfer();
		const inputFile = document.querySelector("#file-input");
		e.preventDefault();								//기본 이벤트 정지, 정지하지 않을 경우 새 창에서 이미지 열림
		dropArea.style.backgroundColor = "#fff";
		const files = e.dataTransfer.files;				//input태그에 담긴 파일들을 데이터 트랜스퍼 객체를 통해 옮겨담음
		for (let i = 0; i < files.length; i++) {
			let file = files[i];
			if (file && file.type.startsWith("image")) {
				dataTranster.items.add(file);			//이미지일 경우 추가
			}
		};
		inputFile.files = dataTranster.files;			//인풋태그의 파일들 교체
		console.log(inputFile);
		imgUpload(inputFile.files);						//서버로 이미지 데이터 전송
	});



	// 클릭 이벤트 처리
	uploadImageButton.addEventListener("click", function() {
		fileInput.click();
	});

	deleteImageButton.addEventListener("click", function() {
		let nodes = document.querySelector("#uploadedImages").querySelector("div").querySelectorAll("div");
		let deleteFile;
		for (let i = 0; i < nodes.length; i++) {
			if (nodes[i].getAttribute("class").includes("active")) {
				deleteFile = nodes[i];
			}
		}
		if(deleteFile != null){
			let deleteFilePath = deleteFile.querySelector("img").getAttribute("uploadpath") + "\\" + deleteFile.querySelector("img").getAttribute('uuid') + "_" + deleteFile.querySelector("img").getAttribute('fileName');
			console.log(deleteFilePath);
			let deleteFileType = "zip";
			$.ajax({
				url: '/deleteFile',
				data: {fileName : deleteFilePath, type : deleteFileType},
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeader, csrfToken);
				},
				type: 'POST',
				success: function(result) {
					console.log(result);
		
					deleteFile.remove();
					nodes = document.querySelector("#uploadedImages").querySelector("div").querySelectorAll("div");
					//console.log(document.querySelectorAll('[fileName='+'"'+deleteFile.querySelector("img").getAttribute('fileName')+'"'+']'));
					//document.querySelector('[fileName='+'"'+deleteFile.querySelector("img").getAttribute('fileName')+'"'+']').remove();
					if (nodes.length != 0) {
						nodes[0].setAttribute("class", nodes[0].getAttribute("class") + " active");
					} else {
						var emptyNode = document.createElement("div");
						var emptyP = document.createElement("p");
						emptyNode.setAttribute("id", "drop-area");
						emptyNode.setAttribute("style", "width:100%;");
						emptyP.innerText = "이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.";
						emptyNode.appendChild(emptyP);
						document.querySelector("#uploadedImages").querySelector("div").appendChild(emptyNode);
					}

				},
				error: function(result) {
					console.log(result);
				}
			}); //$.ajax
		}
	});

};

if (!(document.getElementById("drop-area") === null)&&!(document.querySelector('input[id="file-input"]')===null)) {

	dropArea.setAttribute('eventList', 'click');
	dropArea.addEventListener("click", onClickFunction);
	console.log("event set");
} else {
	if (document.getElementById("drop-area") === null&&!(document.querySelector('input[id="file-input"]')===null)) {
		if (!(dropArea.getAttribute('eventList') === null)) {
			dropArea.removeAttribute('eventList');
			dropArea.removeEventListener("click", onClickFunction);
			console.log("event remove");
		}
	}
}

if (!(fileInput == null)) {
	// 파일 입력 필드 변경 이벤트 처리
	fileInput.addEventListener("change", function(e) {
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		console.log(csrfHeader + " : " + csrfToken);
		var inputFile = document.querySelector("#file-input");
		var formData = new FormData();
		var files = inputFile.files;
		console.log(files);
		for (var i = 0; i < files.length; i++) {
			//if(!checkExtension(files[i].name, files[i].size)){
			//console.log(!checkExtension(files[i].name, files[i].size));
			//	return false;
			//}
			console.log(i + files[i] + files[i].name);
			formData.append("uploadFile", files[i], files[i].name);
		};
		for (var pair of formData.entries()) {
			console.log(pair[0] + ', ' + pair[1]);
		}
		var urlString = '/'+ window.location.pathname.split("/")[1]+'/uploadAjaxAction';		//REST방식, 주소 파싱하여 해당 테이블로 전송하기 위한 URI 생성
		console.log(urlString);
		$.ajax({
			url: urlString/*'/uploadAjaxAction'*/,
			processData: false,
			contentType: false,
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			data: formData,
			type: 'POST',
			success: function(result) {
				console.log(result);
				createCarouselInner(result);			//이미지 업로드 성공시 업로드된 이미지를 보여줄 캐러셀 이미지 생성
			},
			error: function(result) {
				alert("uploadFail");
				console.log(result);
			}
		}); //$.ajax
	});

};

function imgUpload(files) {
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	var formData = new FormData();
	console.log(files);
	for (var i = 0; i < files.length; i++) {
		//if(!checkExtension(files[i].name, files[i].size)){			//파일 사이즈 검증 로직, 우선 막음
		//console.log(!checkExtension(files[i].name, files[i].size));
		//	return false;
		//}
		console.log(i + files[i] + files[i].name);
		formData.append("uploadFile", files[i], files[i].name);			//폼에 파일 데이터 추가
	};
	for (var pair of formData.entries()) {
		console.log(pair[0] + ', ' + pair[1]);
	}																	//폼 데이타 파일 출력 코드
	var urlString = '/'+ window.location.pathname.split("/")[1]+'/uploadAjaxAction';		//REST방식, 주소 파싱하여 해당 테이블로 전송하기 위한 URI 생성
	console.log(urlString);
	$.ajax({
		url: urlString/*'/uploadAjaxAction'*/,
		processData: false,
		contentType: false,
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		},
		data: formData,
		type: 'POST',
 		success: function(result) {
			console.log(result);
			createCarouselInner(result);			//이미지 업로드 성공시 업로드된 이미지를 보여줄 캐러셀 이미지 생성
		},
		error: function(result) {
			alert("uploadFail");
			console.log(result);
		}
	}); //$.ajax
}
// 이미지 표시 메서드(테스트용 코드)
function displayImage(file) {
	const reader = new FileReader();
	reader.onload = () => {

		imagePreview.src = reader.result;
		imagePreview.style.display = "block";
	};
	reader.readAsDataURL(file);
}

function displayImage(file, caroucel) {
	const reader = new FileReader();
	reader.onload = () => {
		caroucel.className = "d-block w-100";
		caroucel.style.objectFit = "cover";
		caroucel.src = reader.result;
		caroucel.style.display = "block";
	};
	reader.readAsDataURL(file);
}


const firstPathSegment = window.location.pathname.split("/")[1];
const excludePaths = ['loginAuth', 'home', '','admin'];

if(!excludePaths.includes(firstPathSegment)){
	var formObj=$('form[role="form"]');					//폼 선택 jquery
	
	$("button[type='submit']").on("click", function(e) {
	    e.preventDefault(); // 기본 동작 막기
	    console.log("submit clicked");
	
	    var formData = {}; // 빈 객체 생성
	
	    // 각 input의 값을 formData 객체에 추가
	    $('form[role="form"] input').each(function(index, element) {
	        // 체크박스인 경우에는 선택된 값들을 배열로 추가
	        if (element.type === 'checkbox') {
	            if (!formData[element.name]) {
	                formData[element.name] = [];
	            }
	            if (element.checked) {
	                formData[element.name].push(element.value);
	            }
	        } else {
	            formData[element.name] = element.value;
	        }
	    });
	    
	    $('form[role="form"] textarea' ).each(function(index, element){
			formData[element.name] = element.value;
		});
	
	    // 이미지 태그들을 선택하고 각각의 데이터를 formData 객체에 추가
	    var nodes = document.querySelectorAll("#uploadedImages img");
	    formData.imgList = [];
	    formData.titleList = [];
	    formData.contentList = [];
	    nodes.forEach(function(img, index) {
	        var imageObj = {
	            fileName: img.getAttribute("fileName"),
	            uploadPath: img.getAttribute("uploadPath"),
	            uuid: img.getAttribute("uuid")
	        };
	        formData.imgList.push(imageObj);
	    });
	    
	    if (document.getElementById("uploadedImages2")!==null&&document.getElementById("uploadedImages3")!==null){
			var nodes2 = document.querySelectorAll("#uploadedImages2 img");
		    formData.titleList = [];
		    nodes2.forEach(function(img, index) {
		        var imageObj = {
		            fileName: img.getAttribute("fileName"),
		            uploadPath: img.getAttribute("uploadPath"),
		            uuid: img.getAttribute("uuid")
		        };
		        formData.titleList.push(imageObj);
		    });
		    var nodes3 = document.querySelectorAll("#uploadedImages2 img");
		    formData.contentList = [];
		    nodes3.forEach(function(img, index) {
		        var imageObj = {
		            fileName: img.getAttribute("fileName"),
		            uploadPath: img.getAttribute("uploadPath"),
		            uuid: img.getAttribute("uuid")
		        };
		        formData.contentList.push(imageObj);
		    });
		}
	    var url = '/'+ window.location.pathname.split("/")[1];
	    var urlString = url+"/"+window.location.pathname.split("/")[2];
	    console.log("urlString : "+urlString);
	    var urlListString = url+'/list';
	    if(urlString==="/member/register"){	
			urlListString = '/loginAuth';
		} else if(url==="/member"){
			urlListString = '/';
		}
	    // AJAX 요청 보내기
	    $.ajax({
	        type: "POST", // POST 방식 설정
	        url: urlString, // 요청 보낼 URL 설정
	        data: JSON.stringify(formData), // JSON 형식으로 데이터 변환
	        contentType: "application/json; charset=UTF-8", // 요청의 컨텐츠 타입 설정
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken); // CSRF 토큰 추가
	        },
	        success: function(response) {
	            console.log("Success:", response);
	            alert(window.location.pathname.split("/")[2]+" Success!!!");
	            location.replace(urlListString);
	            // 성공했을 때 실행할 코드 작성
	        },
	        error: function(xhr, status, error) {
	            console.error(xhr);
	            console.error(status);
	            console.error("Error:", error);
	            // 오류 발생 시 실행할 코드 작성
	        }
	    });
	});
	// ajax file upload method
}

$("#uploadBtn").on("click", (e) => {
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	console.log(csrfHeader + " : " + csrfToken);
	var formData = new FormData();
	var inputFile = document.querySelector("#file-input");
	var files = inputFile.files;
	console.log(files);
	for (var i = 0; i < files.length; i++) {
		//if(!checkExtension(files[i].name, files[i].size)){
		//console.log(!checkExtension(files[i].name, files[i].size));
		//	return false;
		//}
		console.log(i + files[i] + files[i].name);
		formData.append("uploadFile", files[i], files[i].name);
	};
	for (var pair of formData.entries()) {
		console.log(pair[0] + ', ' + pair[1]);
	}

	var urlString = '/'+ window.location.pathname.split("/")[1]+'/uploadAjaxAction';		//REST방식, 주소 파싱하여 해당 테이블로 전송하기 위한 URI 생성
	console.log(urlString);
	$.ajax({
		url: urlString/*'/uploadAjaxAction'*/,
		processData: false,
		contentType: false,
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		},
		data: formData,
		type: 'POST',
		success: function(result) {
			console.log(result);
			createCarouselInner(result);			//이미지 업로드 성공시 업로드된 이미지를 보여줄 캐러셀 이미지 생성
		},
		error: function(result) {
			alert("uploadFail");
			console.log(result);
		}
	}); //$.ajax
});

function isChecked(e){ // 체크박스 값 확인해서 권한 변경 요청
	var id = e.value;
    var auth = "ROLE_MANAGER";
	if (e.checked){
		auth = "ROLE_MANAGER"
	}else{
        auth = "ROLE_MEMBER";
	}
    var requestData = {
	    id: id,
	    auth: auth
    };
    $.ajax({
        url: "/admin/authChange",
        type: "POST",
        contentType: "application/json",
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		},
        data: JSON.stringify(requestData),
        success: function(response) {
            alert(response + " : change Success!");
            console.log("Success:", response);
        },
        error: function(xhr,error) {
            alert(error);
            console.error("Error:", xhr.responseText);
        }
    });
};

function deleteData(e){
	//e.preventDefault();
	if(confirm("정말 삭제하시겠습니까?")==true){
		var bno = parseInt(e.value);
		var requestData = {
			bno : bno
		}
		var urlString = '/'+ window.location.pathname.split("/")[1]+'/delete';
		if (window.location.pathname.split("/")[1] === "admin"){
			urlString = '/'+ 'member'+'/delete';
		}
		$.ajax({
	        url: urlString,
	        type: "POST",
	        contentType: "application/json",
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
	        data: JSON.stringify(requestData),
	        success: function(response) {
                alert("삭제되었습니다!"); // 서버에서 반환한 메시지 출력
                console.log("Success:", response);
                location.replace("/");
            },
            error: function(xhr,error) {
                alert(error);
                console.error("Error:", xhr.responseText);
            }
	    });
	} else {
		return;
	}
};

document.addEventListener('click', function(event) {
    if (event.target.tagName === 'A' && event.target.classList.contains('page-link')) {
        event.preventDefault();
        console.log('click');
        var actionForm = document.getElementById("searchForm");
        var pageNumInput = actionForm.querySelector("input[name='pageNum']");
        pageNumInput.value = event.target.getAttribute("href");
        actionForm.submit();
    }
});