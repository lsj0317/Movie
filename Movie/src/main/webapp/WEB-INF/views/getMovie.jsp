<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>


<style type="text/css">
img {
	height: 500px;
	background: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2));
	background-position: center center;
	background-repeat: no-repeat;
	background-size: cover;
	object-fit: cover;
}

.img-dark {
	background-color: black;
	/* 	filter: brightness(80%);
	background: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)); */
}

.best-img {
	height: 200px;
}

.stillcut {
	background-image: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)),
		url(./resources/img/dune-2.jpg);
	background-position: center center;
	background-repeat: no-repeat;
	background-size: cover;
	/* 	padding: 160px 0 60px 0;   */
}

/* 별점 체크용 */
.starAdd {
    position: relative;
    font-size: 2rem; 
    color: #ddd;
}

.starAdd input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
}

.starAdd span {
   height: 100%;
    width: 0px;
    position: absolute;
    font-size: 2rem;
    left: 0;
    /* color: red; */
    overflow: hidden;
    pointer-events: none;
}

.countingStar {
   color: yellow;
   font-size: 2rem;
    text-shadow: 0 0 5px yellow;
}

.staff {
	width: 75px;
	height: 75px;
}

</style>
<div class="col-lg-12 pt-6">
	<div id="uploadedImages2" class="carousel slide carousel-fade" data-bs-ride="carousel">
      		<div class="carousel-inner" id="carousel-inner2" style="width:100%;height:auto;">
			<c:forEach items="${movie.titleList}" var="img" varStatus="i" begin="0">
				<c:choose>
				    <c:when test="${not empty img}">
				    	<c:choose>
				    		<c:when test="${ i.index == 0 }">
				    			<div class="carousel-item active">
				    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
									<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
									<c:url var="imageUrl" value="/movies/download"/>
									<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
				    			</div>
				    		</c:when>
				    		<c:otherwise>
				    			<div class="carousel-item">
				    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
									<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
									<c:url var="imageUrl" value="/movies/download"/>
									<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
				    			</div>
				    		</c:otherwise>
				    	</c:choose>
				    </c:when>
				    <c:otherwise>
				        <!-- 이미지가 없는 경우 대체 내용 추가 -->
				        <div id="drop-area" style="width:100%;">
							<p>이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.</p>
	        			</div>
				    </c:otherwise>
				</c:choose>
			</c:forEach>
      		</div>
      		<button class="carousel-control-prev" type="button" data-bs-target="#uploadedImages2" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#uploadedImages2" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
      	</div>
</div>

<!-- About Start -->
<div class="container-fluid about bg-light py-5">
	<div class="container py-5">
		<div class="row row-cols-2 g-5 align-items-center">
			<div class="col-lg-5 wow fadeInLeft" data-wow-delay="0.2s">
				<div id="uploadedImages" class="carousel slide carousel-fade" data-bs-ride="carousel">
	        		<div class="carousel-inner" style="width:100%;height:auto;">
						<c:forEach items="${movie.imgList}" var="img" varStatus="i" begin="0">
							<c:choose>
							    <c:when test="${not empty img}">
							    	<c:choose>
							    		<c:when test="${ i.index == 0 }">
							    			<div class="carousel-item active">
							    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
												<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
												<c:url var="imageUrl" value="/movies/download"/>
												<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
							    			</div>
							    		</c:when>
							    		<c:otherwise>
							    			<div class="carousel-item">
							    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
												<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
												<c:url var="imageUrl" value="/movies/download"/>
												<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
							    			</div>
							    		</c:otherwise>
							    	</c:choose>
							    </c:when>
							    <c:otherwise>
							        <!-- 이미지가 없는 경우 대체 내용 추가 -->
							        <div id="drop-area" style="width:100%;">
										<p>이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.</p>
				        			</div>
							    </c:otherwise>
							</c:choose>
						</c:forEach>
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
	        </div>
			<div class="col-lg-7 wow fadeInRight" data-wow-delay="0.4s">
				<div class="section-title text-start mb-5">
					<h4 class="sub-title pe-3 mb-0">Movie Info</h4>
					<h1 class="display-3 mb-4"><c:out value="${movie.title }"/></h1>
					<!-- 평균 별점 들어갈 곳 -->
					<p class="mb-4"><c:out value="${movie.content }"/></p>
					<div class="mb-4">
						<p class="text-secondary">
							<i class="fa fa-check text-primary me-2"></i> 쿠키있음
						</p>
						<p class="text-secondary">
							<i class="fa fa-check text-primary me-2"></i> 전체이용가
						</p>
					</div>
					<a href="#"
						class="btn btn-primary rounded-pill text-white py-3 px-5">Discover
						More</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- About End -->
<br>
<br>
<div class="container py-5">
<h4>출연/제작</h4></div>
	<!-- director -->
<div class="container-sm">
	<div class="row g-4 justify-content-left mb-5">

		<div class="row wow fadeInUp" data-wow-delay="0.1s">
			<c:forEach var="director" items="${movie.dirList}">
			<div class="col-1">
					<c:choose>
						<c:when test="${not empty director.imgList}">
							<c:set var="uploadPath"
								value="${fn:replace(director.imgList[0].uploadPath, '\\\\', '/')}" />
							<c:set var="imagePath"
								value="${uploadPath}/${director.imgList[0].uuid}_${director.imgList[0].fileName}" />
							<c:url var="imageUrl" value="/director/download" />
							<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"
								class="img-thumbnail rounded-circle staff" alt="">
						</c:when>
						<c:otherwise>
							<!-- 이미지가 없는 경우 대체 내용 추가 -->
							<p>이미지가 없습니다.</p>
						</c:otherwise>
					</c:choose>

				</div>
			<div class="col-1" style="text-align: center;">
				<span><strong>${director.dirName }</strong></span><br>
				<span><small>${director.age }</small></span>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
<!-- .director -->

<!-- actor -->
<div class="container-sm">
	<div class="row g-4 justify-content-left mb-5">
	
		<div class="row wow fadeInUp" data-wow-delay="0.1s">
			<c:forEach var="actor" items="${movie.actList}">
			<div class="col-1">
					<c:choose>
						<c:when test="${not empty actor.imgList}">
							<c:set var="uploadPath"
								value="${fn:replace(actor.imgList[0].uploadPath, '\\\\', '/')}" />
							<c:set var="imagePath"
								value="${uploadPath}/${actor.imgList[0].uuid}_${actor.imgList[0].fileName}" />
							<c:url var="imageUrl" value="/actor/download" />
							<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"
								class="img-thumbnail rounded-circle staff" alt="">
						</c:when>
						<c:otherwise>
							<!-- 이미지가 없는 경우 대체 내용 추가 -->
							<p>이미지가 없습니다.</p>
						</c:otherwise>
					</c:choose>

				</div>
			<div class="col-1" style="text-align: center;">
				<span><strong>${actor.name }</strong></span><br>
				<span><small>${actor.age }</small></span>
			</div>
			</c:forEach>
		</div>
	</div>
<!-- .actor -->


	<div id="uploadedImages3" class="carousel slide carousel-fade" data-bs-ride="carousel">
   		<div class="carousel-inner" id="carousel-inner3" style="width:100%;height:auto;">
			<c:forEach items="${movie.contentList}" var="img" varStatus="i" begin="0">
				<c:choose>
				    <c:when test="${not empty img}">
				    	<c:choose>
				    		<c:when test="${ i.index == 0 }">
				    			<div class="carousel-item active">
				    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
									<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
									<c:url var="imageUrl" value="/movies/download"/>
									<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
				    			</div>
				    		</c:when>
				    		<c:otherwise>
				    			<div class="carousel-item">
				    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
									<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
									<c:url var="imageUrl" value="/movies/download"/>
									<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
				    			</div>
				    		</c:otherwise>
				    	</c:choose>
				    </c:when>
				    <c:otherwise>
				        <!-- 이미지가 없는 경우 대체 내용 추가 -->
				        <div id="drop-area" style="width:100%;">
							<p>이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.</p>
	        			</div>
				    </c:otherwise>
				</c:choose>
			</c:forEach>
   		</div>
   		<button class="carousel-control-prev" type="button" data-bs-target="#uploadedImages3" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#uploadedImages3" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
   	</div>
</div>
<div class="container-sm">
	<!-- Content here -->
	<!-- 코멘트 -->
	<div class="container-xs">
		<div class="container py-5">
			<label>쿠키 영상</label>
			<c:set var="videoId" value="" />
			<c:choose>
			    <c:when test="${not empty movie.video and movie.video.startsWith('https://youtu.be/')}">
			        <c:set var="videoId" value="${fn:substringAfter(movie.video, 'https://youtu.be/')}"/>
			    </c:when>
			    <c:when test="${not empty movie.video and movie.video.startsWith('https://www.youtube.com/watch?v=')}">
			        <c:set var="videoId" value="${fn:substringAfter(movie.video, 'https://www.youtube.com/watch?v=')}"/>
			        <c:if test="${videoId.contains('&')}">
			            <c:set var="videoId" value="${fn:substringBefore(videoId, '&')}"/>
			        </c:if>
			    </c:when>
			    <c:otherwise>
			        <p>올바른 YouTube URL을 입력하세요.</p>
			    </c:otherwise>
			</c:choose>
			<c:if test="${not empty videoId}">
			    <div class="form-group"  id="video-container">
			        <div class="card card-body">
			            <iframe id="videoViewer" width="100%" height="1000vh" src='https://www.youtube.com/embed/${ videoId }' frameborder='0' allowfullscreen='true' ></iframe>
			        </div>
			    </div>
			</c:if>
		</div>
	</div>
</div>
<!-- 베스트 댓글  -->
<div class="row g-4 justify-content-center">
	<div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp"
		data-wow-delay="0.1s">
		<div class="service-item rounded shadow-lg">
			<div class="service-content rounded-top rounded-bottom bg-light p-4">
				<div class="starts mb-3 d-flex justify-content-center">
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	            </div>
				<div class="service-content-inner">
					<h5 class="mb-4">베스트 댓글1</h5>
					<p class="mb-4">Dolor, sit amet consectetur adipisicing elit.
						Soluta inventore cum accusamus, dolor qui ullam</p>
					<a href="#"
						class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">view</a>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp"
		data-wow-delay="0.1s">
		<div class="service-item rounded shadow-lg">
			<div class="service-content rounded-top rounded-bottom bg-light p-4">
				<div class="starts mb-3 d-flex justify-content-center">
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	            </div>
				<div class="service-content-inner">
					<h5 class="mb-4">베스트 댓글2</h5>
					<p class="mb-4">Dolor, sit amet consectetur adipisicing elit.
						Soluta inventore cum accusamus, dolor qui ullam</p>
					<a href="#"
						class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">view</a>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp"
		data-wow-delay="0.1s">
		<div class="service-item rounded shadow-lg">
			<div class="service-content rounded-top rounded-bottom bg-light p-4">
				<div class="starts mb-3 d-flex justify-content-center">
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	            </div>
	            <div class="service-content-inner">
					<h5 class="mb-4"><c:out value="${user.membno }"/></h5>
					<p class="mb-4">Dolor, sit amet consectetur adipisicing elit.
						Soluta inventore cum accusamus, dolor qui ullam</p>
					<a href="#"
						class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">view</a>
				</div>
			</div>
		</div>
	</div>

</div>



<br>
<div class="container-sm">
	<!-- Content here -->
	<!-- 코멘트 -->
	<div class="container-xs">
		<div class="container py-5">
			<h4>Comment</h4>
			<div class="wow fadeInUp" data-wow-delay="0.1s">
				<div class="col-lg-12">


					<div class="row">
						<c:forEach items="${movie.comment}" var="comment">
							<div class="col-6 col-md-6">
								<ul class="list-group">
									<li class="list-group-item border-0">
										<div class="service-item rounded shadow-sm">
											<div
												class="service-content rounded-top rounded-bottom bg-light p-4">
												<div class="row">
													<div class="col d-flex">
														<p class="mb-4">
															<strong id="userNick"><c:out
																	value="${comment.nickName}" /></strong>
														</p>
													</div>
													<div class="col d-flex justify-content-end">
														<!-- 로그인한 사용자가 댓글 작성자와 동일한지 확인 -->
														<sec:authentication property="principal" var="pinfo" />
														<sec:authorize access="isAuthenticated()">
															<c:choose>
																<c:when test="${user.id eq pinfo.username}">

																	<!-- 본인이 작성한 댓글인 경우 수정 및 삭제 버튼 표시 -->
																	<button type="button" id="modalOpen"
																		data-combno='${comment.comBno}'
																		class="btn btn-outline-info btn-sm midify-comment-button"
																		style="height: 30px; text-align: center; margin-right: 5px;">
																		<small>수정</small>
																	</button>
																	<input type="hidden" name='content' value="<c:out value="${comment.comBno}"/>" id='hdInput'/>
																	<a data-combno='${comment.comBno}'
																		class="btn btn-danger text-white btn-sm delete-comment-button"
																		style="height: 30px;"> 삭제 </a>
																</c:when>
																<c:otherwise>
																	<!-- 본인이 작성하지 않은 댓글인 경우 버튼을 표시하지 않음 -->
																</c:otherwise>
															</c:choose>
														</sec:authorize>
													</div>
												</div>
												<div class="service-content-inner">
													<p class="mb-4">
													<p class="commentText">
														<c:out value="${comment.content}"></c:out>
													</p>
													<!-- 숨겨져 있다가 버튼을 누르면 나타나는 인풋창 -->
													<input type="text" class="form-control modInput"
														placeholder="수정할 댓글을 입력하세요" style="display: none;">
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</c:forEach>

					</div>

				</div>
			</div>
			<!-- ./ 코멘트 -->
	<!-- 코멘트 입력 -->
	
	<div class="service-content rounded bg-light p-4 mt-3">
		<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

						<div class="panel-heading"></div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							
<%-- 								<c:set value="${movie.comment}" var="writer"/> <!-- 모델 영역의 객체 변수화 -->
 --%>								
							<form role="form" action="/regComment" method="post">

							     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>      

							      <span class="starAdd">
							          <!-- 기존 별 -->
							            <i class="fa fa-star"></i>
							            <i class="fa fa-star"></i>
							            <i class="fa fa-star"></i>
							            <i class="fa fa-star"></i>
							            <i class="fa fa-star"></i>
							          <!-- 체크하면 나타날 별 -->
							          <span class="">
							             <i class="fa fa-star countingStar"></i>
							              <i class="fa fa-star countingStar"></i>
							              <i class="fa fa-star countingStar"></i>
							              <i class="fa fa-star countingStar"></i>
							              <i class="fa fa-star countingStar"></i>
							          </span>
							          <!-- 별점 체크를 위한 input(hidden) -->
							          <input id="inputs" type="range" oninput="addStar(this)" value="0" step="1" min="0" max="5">
							      </span>
							      <div class="avg-txt">
							            평점 :<input type="hidden" id='starVal' name='stars'/> <span id="scores">0.0</span> / 5.0
							            <!-- 평점 숫자 출력되는 부분 -->
							      </div>


								<div class="form-group">
									<textarea class="form-control" rows="3" name='content' id='content'></textarea>
								</div><br>
								 <sec:authorize access="isAuthenticated()">
								<div class="form-group">
									<label>작성자</label> <input class="form-control" name="writer" value='${ user.nickName }' readonly="readonly">
										 <input type="hidden" name='memBno' value='<c:out value="${ user.membno }"/>' id='memBno'/> 
								</div><br>
										</sec:authorize>
								 <sec:authorize access="isAnonymous()">
								<div class="form-group">
									<label>작성자</label> <input type="text" class="form-control" name="writer" readonly />
								</div><br>
										</sec:authorize>
								
							
								<input type="hidden" name='movBno' value="<c:out value="${movie.movBno }"/>" id='movBno'/>
								

								
								<button type="submit" id="commentBtn" class="btn btn-primary rounded-pill text-white py-2 px-4 flex-wrap flex-sm-shrink-0">Submit
									Button</button>
						
								<button type="reset" class="btn btn-danger rounded-pill px-3">Reset
									Button</button>
							</form>

						</div>
						<!--  end panel-body -->

					</div>
					<!--  end panel-body -->
				</div>
				<!-- end panel -->
			</div>
			<!-- /.row -->
		</div>
		
		
	</div>
	<!-- /div.wow fadeInUp -->
</div>

</div>
<br>

	
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-secondary">
				<h4 class="modal-title" id="myModalLabel">댓글수정</h4>
				<button type="button" class="btn btn-danger" data-dismiss="modal"
					aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="mb-2 mt-2">댓글</label>
					<%-- <c:set value="${movie.comment}" var="comment"/> --%>
					<textarea class="form-control" name='content' id="modContent"></textarea>
				</div>
				<div class="form-group">
					<label class="mb-2 mt-2">작성자</label> <input class="form-control"
						name='writer'
						value='${user.nickName }'
						readonly="readonly">
				</div>
				<div class="form-group">
					<label class="mb-2 mt-2">수정일</label> <input class="form-control"
						name='update' readonly="readonly" value="${comment.regDate}">
				</div>
			</div>
			<hr>
			<div
				class="modal-footer d-flex justify-content-center align-items-center">
				<button id='modalModBtn' type="button" class="btn btn-success">수정하기</button>
				<!-- <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button> -->
				<!-- <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button> -->
				<button id='modalCloseBtn' type="button" class="btn btn-danger">닫기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
    function resizeIframe() {
        var iframe = document.getElementById('videoViewer');
        var width = iframe.offsetWidth; // iframe의 너비 가져오기
        var aspectRatio = 16 / 9; // 가로-세로 비율 (예: 16:9)
        var height = width / aspectRatio; // 높이 계산
        iframe.style.height = height + 'px'; // 높이 설정
    }

    window.onload = resizeIframe;
    window.onresize = resizeIframe; // 브라우저 크기 변경 시 재조정
    
    document.addEventListener('DOMContentLoaded', (event) => {
        
    	// 댓글 삭제
    	function deleteComment(event) {
    	    event.preventDefault();
    	    var comBno = $(this).data('combno'); // HTML에서 data- 속성을 통해 댓글 번호 접근
    	    console.log("삭제하는 댓글의 번호 : " + comBno + "번");
    	    
    	    var thisPageNum = $("#movieNums").val();
    	    console.log("댓글을 삭제하는 페이지의 번호 : " + thisPageNum + "번");

    	    var token = $("meta[name='_csrf']").attr("content");
    	    var header = $("meta[name='_csrf_header']").attr("content");
    	    
    	    if (confirm("해당 댓글을 삭제하시겠습니까?")) {
    	        $.ajax({
    	            url: '/movies/deleteComment/'+comBno,
    	            type: 'DELETE', // HTTP 메소드를 DELETE로 변경
    	            // contentType과 dataType은 이 경우에 따라 필요하지 않을 수 있습니다.
    	            // 특히, 단순 문자열 응답을 처리하는 경우에는 dataType을 생략하거나 변경할 수 있습니다.
    	            // 깃 테스트sss
    	            data : {
    	            	comBno : comBno
    	            },
    	            beforeSend : function(xhr) {
    	                xhr.setRequestHeader(header, token);
    	            },
    	            success: function(response) {
    	                // 성공 시 페이지 새로고침 또는 DOM을 사용하여 댓글 목록 업데이트
    	                alert("댓글이 성공적으로 삭제되었습니다.");
    	                location.reload(); // 예시로 페이지 새로고침
    	            },
    	            error: function(xhr, status, error) {
    	                alert("댓글 삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
    	                console.error("Error: " + status + " - " + error);
    	            }
    	        });
    	    }
    	}

    	// 댓글수정
    	let button = document.getElementById("modalOpen");
    	button.addEventListener("click", function(e) {
    		e.preventDefault(); // 'e'를 사용하여 이벤트의 기본 동작을 방지
    	    if (confirm("댓글을 수정하시겠습니까?")) {

    	    	var modal = $(".modal");
    		    $(".modal").modal("show");
    	    	var modBtn = $("#modalModBtn");
    	    	modBtn.on("click", function() {
	    		    var comBno = $("#hdInput").val(); // 숨겨진 commentBno값
	    		    console.log("수정할 댓글번호 : " + comBno);
	    		    //var content = $("#content").text; // 댓글 내용 가져오기
	    		    var modContent = $('#modContent').val(); // textarea에서 댓글 텍스트 가져오기
	    		    console.log("수정할 댓글내용 : " + modContent + "번");
    		    	console.log(content);
    	    		// CSRF 토큰 가져오기
    		        var token = $("meta[name='_csrf']").attr("content");
    		        var header = $("meta[name='_csrf_header']").attr("content");

    		        $.ajax({
    		            url: '/movies/modifyComment/' + comBno,
    		            type: 'POST',
    		            contentType: 'application/json', // JSON 형식으로 데이터 전송
    		            data: JSON.stringify({
    		                comBno: comBno,
    		                content: modContent
    		            }),
    		            beforeSend: function(xhr) {
    		                xhr.setRequestHeader(header, token);
    		            },
    		            success: function(response) {
    		                alert("댓글이 성공적으로 수정되었습니다.");
    		                location.reload(); // 페이지 새로고침
    		            },
    		            error: function(xhr, status, error) {
    		                alert("댓글 수정 중 오류가 발생했습니다. 다시 시도해주세요.");
    		                console.error("Error: " + status + " - " + error);
    		            }
    		        });
    	    	});
    	    }
    	});



    	// 닫기 버튼 누를시 모달창 닫기 이벤트
    	$("#modalCloseBtn").on("click", function(e){
    		var modal = $(".modal");
    		modal.modal('hide');
    	});

    	// 버튼에 이벤트 리스너 연결  - 삭제
    	$('.delete-comment-button').on('click', deleteComment);
    });

</script>