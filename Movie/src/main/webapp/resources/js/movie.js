const dropArea2 = document.getElementById("uploadedImages2");
const dropArea3 = document.getElementById("uploadedImages3");
var fileInput2 = document.getElementById("file-input2");
var fileInput3 = document.getElementById("file-input3");
var uploadImageButton2 = document.getElementById("uploadImage2");	//캐러셀 이미지 등록 버튼
var deleteImageButton2 = document.getElementById("deleteImage2");	//캐러셀 이미지 삭제 버튼
var uploadImageButton3 = document.getElementById("uploadImage3");	//캐러셀 이미지 등록 버튼
var deleteImageButton3 = document.getElementById("deleteImage3");	//캐러셀 이미지 삭제 버튼
var uploadedImages2 = document.getElementById("carousel-inner2");	//이미지 표시할 캐러셀
var uploadedImages3 = document.getElementById("carousel-inner3");	//이미지 표시할 캐러셀


function onClickFunction2() {	//필드 클릭시 이미지 등록 이벤트 등록
	fileInput2.click();
}

function onClickFunction3() {	//필드 클릭시 이미지 등록 이벤트 등록
	fileInput3.click();
}

function createCarouselInner2(fileList) {	//업로드된 이미지를 캐러셀에 등록
	let nodes = document.querySelector("#uploadedImages2").querySelector("div").querySelectorAll("div");
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
		uploadedImages2.appendChild(carouselInner);				//완성된 div를 캐러셀에 등록
	});
	
	//createUploadFileInput(formObj);
	console.log(uploadedImages2);
	dropArea2.removeAttribute('eventList');						//이벤트 등록 정보 태그 삭제
	dropArea2.removeEventListener("click", onClickFunction2);		//캐러셀 클릭 이벤트 제거
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
		document.querySelector("#uploadedImages2").querySelector("div").appendChild(emptyNode);

		dropArea2.setAttribute('eventList', 'click');														//클릭 이벤트 등록 정보 태그 생성
		dropArea2.addEventListener("click", onClickFunction2);												//클릭 이벤트 등록
		console.log("event set");
	}

};

function createCarouselInner3(fileList) {	//업로드된 이미지를 캐러셀에 등록
	let nodes = document.querySelector("#uploadedImages3").querySelector("div").querySelectorAll("div");
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
		uploadedImages3.appendChild(carouselInner);				//완성된 div를 캐러셀에 등록
	});
	
	//createUploadFileInput(formObj);
	console.log(uploadedImages3);
	dropArea3.removeAttribute('eventList');						//이벤트 등록 정보 태그 삭제
	dropArea3.removeEventListener("click", onClickFunction3);		//캐러셀 클릭 이벤트 제거
	console.log("event remove");

	let nodeList = document.querySelector("#uploadedImages3").querySelector("div").querySelectorAll("div");	//캐러셀 이너 div 선택
	console.log(nodeList);
	if (nodeList.length == 0) {																				//캐러셀 이너 div에 내용이 없을 경우 기본 이미지 등록
		var emptyNode = document.createElement("div");
		var emptyP = document.createElement("p");
		emptyNode.setAttribute("id", "drop-area");
		emptyNode.setAttribute("style", "width:100%;");
		emptyP.innerText = "이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.";
		emptyNode.appendChild(emptyP);
		document.querySelector("#uploadedImages").querySelector("div").appendChild(emptyNode);

		dropArea3.setAttribute('eventList', 'click');														//클릭 이벤트 등록 정보 태그 생성
		dropArea3.addEventListener("click", onClickFunction3);												//클릭 이벤트 등록
		console.log("event set");
	}

};

function imgUpload2(files) {
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
			createCarouselInner2(result);			//이미지 업로드 성공시 업로드된 이미지를 보여줄 캐러셀 이미지 생성
		},
		error: function(result) {
			alert("uploadFail");
			console.log(result);
		}
	}); //$.ajax
}

function imgUpload3(files) {
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
			createCarouselInner3(result);			//이미지 업로드 성공시 업로드된 이미지를 보여줄 캐러셀 이미지 생성
		},
		error: function(result) {
			alert("uploadFail");
			console.log(result);
		}
	}); //$.ajax
}

if (!(dropArea2 == null)) {
	// 드래그 앤 드롭 이벤트 처리
	dropArea2.addEventListener("dragover", (e) => {		//마우스 위치 이벤트 등록
		e.preventDefault();
		dropArea.style.backgroundColor = "#eee";
	});

	dropArea2.addEventListener("dragleave", () => {		//마우스 위치 이벤트 등록
		dropArea.style.backgroundColor = "#fff";
	});

	dropArea2.addEventListener("drop", (e) => {			//이미지 드롭 이벤트 등록
		const dataTranster = new DataTransfer();
		const inputFile = document.querySelector("#file-input2");
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
		imgUpload2(inputFile.files);						//서버로 이미지 데이터 전송
	});



	// 클릭 이벤트 처리
	uploadImageButton2.addEventListener("click", function() {
		fileInput2.click();
	});

	deleteImageButton2.addEventListener("click", function() {
		let nodes = document.querySelector("#uploadedImages2").querySelector("div").querySelectorAll("div");
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
					nodes = document.querySelector("#uploadedImages2").querySelector("div").querySelectorAll("div");
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
						document.querySelector("#uploadedImages2").querySelector("div").appendChild(emptyNode);
					}

				},
				error: function(result) {
					console.log(result);
				}
			}); //$.ajax
		}
	});

};

if (!(dropArea3 == null)) {
	// 드래그 앤 드롭 이벤트 처리
	dropArea3.addEventListener("dragover", (e) => {		//마우스 위치 이벤트 등록
		e.preventDefault();
		dropArea.style.backgroundColor = "#eee";
	});

	dropArea3.addEventListener("dragleave", () => {		//마우스 위치 이벤트 등록
		dropArea.style.backgroundColor = "#fff";
	});

	dropArea3.addEventListener("drop", (e) => {			//이미지 드롭 이벤트 등록
		const dataTranster = new DataTransfer();
		const inputFile = document.querySelector("#file-input3");
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
		imgUpload3(inputFile.files);						//서버로 이미지 데이터 전송
	});



	// 클릭 이벤트 처리
	uploadImageButton3.addEventListener("click", function() {
		fileInput3.click();
	});

	deleteImageButton3.addEventListener("click", function() {
		let nodes = document.querySelector("#uploadedImages3").querySelector("div").querySelectorAll("div");
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
					nodes = document.querySelector("#uploadedImages3").querySelector("div").querySelectorAll("div");
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
						document.querySelector("#uploadedImages3").querySelector("div").appendChild(emptyNode);
					}

				},
				error: function(result) {
					console.log(result);
				}
			}); //$.ajax
		}
	});
};

if (!(document.getElementById("drop-area2") === null)&&!(document.querySelector('input[id="file-input2"]')===null)) {

	dropArea2.setAttribute('eventList', 'click');
	dropArea2.addEventListener("click", onClickFunction2);
	console.log("event set");
} else {
	if (document.getElementById("drop-area2") === null&&!(document.querySelector('input[id="file-input2"]')===null)) {
		if (!(dropArea2.getAttribute('eventList') === null)) {
			dropArea2.removeAttribute('eventList');
			dropArea2.removeEventListener("click", onClickFunction2);
			console.log("event remove");
		}
	}
}

if (!(document.getElementById("drop-area3") === null)&&!(document.querySelector('input[id="file-input3"]')===null)) {

	dropArea3.setAttribute('eventList', 'click');
	dropArea3.addEventListener("click", onClickFunction3);
	console.log("event set");
} else {
	if (document.getElementById("drop-area3") === null&&!(document.querySelector('input[id="file-input3"]')===null)) {
		if (!(dropArea3.getAttribute('eventList') === null)) {
			dropArea3.removeAttribute('eventList');
			dropArea3.removeEventListener("click", onClickFunction3);
			console.log("event remove");
		}
	}
}


if (!(fileInput2 == null)) {
	// 파일 입력 필드 변경 이벤트 처리
	fileInput2.addEventListener("change", function(e) {
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		console.log(csrfHeader + " : " + csrfToken);
		var inputFile = document.querySelector("#file-input2");
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
				createCarouselInner2(result);			//이미지 업로드 성공시 업로드된 이미지를 보여줄 캐러셀 이미지 생성
			},
			error: function(result) {
				alert("uploadFail");
				console.log(result);
			}
		}); //$.ajax
	});

};

if (!(fileInput3 == null)) {
	// 파일 입력 필드 변경 이벤트 처리
	fileInput3.addEventListener("change", function(e) {
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		console.log(csrfHeader + " : " + csrfToken);
		var inputFile = document.querySelector("#file-input3");
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
				createCarouselInner3(result);			//이미지 업로드 성공시 업로드된 이미지를 보여줄 캐러셀 이미지 생성
			},
			error: function(result) {
				alert("uploadFail");
				console.log(result);
			}
		}); //$.ajax
	});

};