<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 바디영역 : 컨테이너 -->
<div id="carouselExample" class="carousel slide stillcut">
	<div class="carousel-inner">
		<div class="carousel-item active" style="background-color: black;">
			<img src="../resources/img/dune-1.jpg" class="d-block w-100 img-dark" alt="...">
		</div>
		<div class="carousel-item">
			<img src="../resources/img/dune-2.jpg" class="d-block w-100 img-dark" alt="...">
		</div>
		<div class="carousel-item">
			<img src="../resources/img/dune-3.jpg" class="d-block w-100 img-dark" alt="...">
		</div>
	</div>
	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Next</span>
	</button>
</div>
	<hr>
	<div class="row ml-5 mb-5">
		<h4 style="padding-left: 50px;">베스트 무비</h4>
	</div>
	<div class="container-fluid row d-flex justify-content-center">
		<c:forEach items="${movieList}" var="movies">
			<div class="card col-lg-4" style="width: 18rem; margin-right: 5px;">
				<c:choose>
				    <c:when test="${not empty movies.imgList}">
				        <c:set var="uploadPath" value="${fn:replace(movies.imgList[0].uploadPath, '\\\\', '/')}"/>
						<c:set var="imagePath" value="${uploadPath}/${movies.imgList[0].uuid}_${movies.imgList[0].fileName}"/>
						<c:url var="imageUrl" value="/movies/download"/>
						<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>" class="card-img-top" alt="">
				    </c:when>
				    <c:otherwise>
				        <!-- 이미지가 없는 경우 대체 내용 추가 -->
				        <img src="../resources/img/image-not-found-icon.png" class="card-img-top" alt="">
				    </c:otherwise>
				</c:choose>
				<div class="card-body">
					<h5 class="card-title">${ movies.title }</h5>
					<p class="card-text">${ fn:substring(movies.content,0,20) } ...</p>
					<p class="card-text"><span>(평점 ${ movies.starsAvg }/5.0)</span></p>
					<a href="/movies/getMovie/${movies.movBno }" class="btn btn-primary">더보기</a>
		 		</div>
			</div>
		</c:forEach>
	</div>
<!-- 사이트 홈 end -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
