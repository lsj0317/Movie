<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


	<div>
        <h4>별점주기 - ver.1</h4>
        <span class="star">
            <!-- 기존 별 -->
            ★★★★★
            <!-- 체크하면 나타날 별 -->
            <span>★★★★★</span>
            <!-- 별점 체크를 위한 input(hidden) -->
            <input id="inputVal" type="range" oninput="checkStar(this)" value="0.0" step="0.5" min="0" max="5">
        </span>
        <div class="avg-txt">
            평점 : <span id="score">0.0</span> / 5.0
            <!-- 평점 숫자 출력되는 부분 -->
        </div>
    </div>

    <br>

    <div>
        <h4>별점주기 - ver.2</h4>
        <div class="star-rating">
            <div class="starts">
                <i class="fa fa-star fz20"></i>
                <i class="fa fa-star fz20"></i>
                <i class="fa fa-star fz20"></i>
                <i class="fa fa-star fz20"></i>
                <i class="fa fa-star fz20"></i>
            </div>
            <div class="print">
                <span class="score"></span>점 / 5점 <span class="comment">점수없음</span>
            </div>
        </div>
    </div>
		

<div class="container text-center">
	<h5>파일 업로드 테스트</h5>
<!-- 		<form method="post" enctype="multipart/form-data" action="/uploadAjaxAction"> -->
			<div style="display: flex;">
				<div id="drop-area">
	        		<p>이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.</p>
<%-- 	        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
	        		<input type="file" name="uploadFile" id="file-input" accept="image/*" style="display: none;" multiple>
	        	</div>
	        	<div id="uploadedImages" class="carousel slide carousel-fade" data-bs-ride="carousel">
	        		<div class="carousel-inner" style="width:100%;height:auto;">
	        		</div>
	        		<button class="carousel-control-prev" type="button" data-bs-target="#uploadedImages" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#uploadedImages" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
	        	</div>
	        	<img id="image-preview" src="" alt="업로드된 이미지">
			</div>
			
			<button type="submit" id="uploadBtn">submit!</button>
<!-- 		</form>	 -->
		<hr>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>