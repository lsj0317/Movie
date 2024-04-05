<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="container  pt-6">
    <div class="card o-hidden border-0 shadow-lg my-3">
        <div class="card-body p-2">
			<div class="row justify-content-center">
				<div class="row justify-content-center">
					<div class="col-lg-12">
						<div id="uploadedImages2" class="carousel slide carousel-fade" data-bs-ride="carousel">
			        		<div class="carousel-inner" id="carousel-inner2" style="width:100%;height:auto;">
								<div id="drop-area2" style="width:100%;">
									<p>이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.</p>
					        	</div>
			        		</div>
			        		<button class="carousel-control-prev" type="button" data-bs-target="#uploadedImages2" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#uploadedImages2" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
							<button type="button" class="carousel-control-add" id="uploadImage2" data-bs-target="#uploadedImages2">
								<span class="bi bi-file-plus fz20" aria-hidden="true"></span>
								<span class="visually-hidden">Add</span>
							</button>
							<button type="button" class="carousel-control-remove" id="deleteImage2" data-bs-target="#uploadedImages2">
								<span class="bi bi-file-x fz20" aria-hidden="true"></span>
								<span class="visually-hidden">Remove</span>
							</button>
			        	</div>
					</div>
					<div class="col-lg-12">
						<h4 class="color00b0f0">영화정보입력</h4>
						<div class="row justify-content-center">
							<input type="file" name="imgList" id="file-input" accept="image/*" style="display: none;" multiple>
							<input type="file" name="imgList" id="file-input2" accept="image/*" style="display: none;" multiple>
							<input type="file" name="imgList" id="file-input3" accept="image/*" style="display: none;" multiple>
							<form role="form" action="/register/new" method="post">
								<div class="row justify-content-center">
									<input type="hidden" name="${_csrf.parameterName}" value = "${_csrf.token}"/>
									<div class="col-4">
										<div id="uploadedImages" class="carousel slide carousel-fade" data-bs-ride="carousel">
							        		<div class="carousel-inner" style="width:100%;height:auto;">
												<div id="drop-area" style="width:100%;">
													<p>이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.</p>
									        	</div>
							        		</div>
							        		<button class="carousel-control-prev" type="button" data-bs-target="#uploadedImages" data-bs-slide="prev">
												<span class="carousel-control-prev-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Previous</span>
											</button>
											<button class="carousel-control-next" type="button" data-bs-target="#uploadedImages" data-bs-slide="next">
												<span class="carousel-control-next-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Next</span>
											</button>
											<button type="button" class="carousel-control-add" id="uploadImage" data-bs-target="#uploadedImages">
												<span class="bi bi-file-plus fz20" aria-hidden="true"></span>
												<span class="visually-hidden">Add</span>
											</button>
											<button type="button" class="carousel-control-remove" id="deleteImage" data-bs-target="#uploadedImages">
												<span class="bi bi-file-x fz20" aria-hidden="true"></span>
												<span class="visually-hidden">Remove</span>
											</button>
							        	</div>
							        </div>
							        <div class="col-8">
						        		<div class="form-group">
								        	<div class="row">
													<label>제목</label><input class="form-control" name='title'>
											</div>
											<div class="row d-flex align-items-center">
												<div class="row d-flex align-items-center">
													<div class="col-4">
														<label>개봉일</label>
													</div>
													<div class="col-4">
														<label>시청자의 권장 연령 등급</label>
													</div>
													<div class="col-4">
														<label>쿠키 유무</label>
													</div>
												</div>
												<div class="row d-flex align-items-center">
													<div class="col-4">
														<div class="form-group">
															<input type="date" name="createdDate" class="form-control" id="date" max="2030-03-20" min="1850-06-05" value="" />
														</div>
													</div>
													<div class="col-4">
														<div class="form-group">
															<select class="form-select">
																<option value="all">전체 이용가</option>
																<option value="7">7세 이상 시청가</option>
																<option value="12">12세 이상 시청가</option>
																<option value="15">15세 이상 시청가</option>
																<option value="19">19세 이상 시청가</option>
															</select>
														</div>
													</div>
													<div class="col-4">
														<div class="form-group">
															<div >
																<input type="checkbox"class="form-check-input" name="major" id="cookies" value="drama"></input>
																<label class="form-check-label" for="cookies">쿠키 유무</label>
															</div>
														</div>
													</div>
												</div>
												<div class="row d-flex align-items-center">
													<label>장르 <span style="color: red">*</span> <span style="font-size: 12px">3개이상 6개이하 체크</span></label>
													<div class="row row-cols-6 d-flex align-items-center">
														<input type="checkbox" class="form-check-input" name="genre" id="drama" value="드라마" />
														<label class="form-check-label" for="drama">드라마</label>
														<input type="checkbox" class="form-check-input" name="genre" id="fantasy" value="판타지" />
														<label class="form-check-label" for="fantasy">판타지</label>
														<input type="checkbox" class="form-check-input" name="genre" id="romance" value="로맨스" />
														<label class="form-check-label" for="romance">로맨스</label>
														<input type="checkbox" class="form-check-input" name="genre" id="ani" value="애니메이션" />
														<label class="form-check-label" for="ani">애니메이션</label>
														<input type="checkbox" class="form-check-input" name="genre" id="mov" value="공포/스릴러" />
														<label class="form-check-label" for="mov">공포/스릴러</label>
														<input type="checkbox" class="form-check-input" name="genre" id="mov" value="액션" />
														<label class="form-check-label" for="mov">액션</label>
													</div>
												</div>
											</div>
										</div>
							        </div>
							        <label>쿠키 영상</label>
									<div class="input-group mb-3">
										<button class="btn btn-outline-secondary" type="button" id="button-addon1"  data-bs-toggle="collapse" data-bs-target="#video-container" aria-expanded="false" aria-controls="video-container">미리보기</button>
										<input type="text" id="videoInput" name="video" class="form-control" placeholder="" aria-label="주소 입력" aria-describedby="button-addon1" oninput="getVideoSource(this)">
									</div>
									<div class="form-group collapse"  id="video-container">
										<div class="card card-body">
											<iframe id="videoViewer" width="1280" height="720" src='https://www.youtube.com/embed/' frameborder='0' allowfullscreen='true' ></iframe>
										</div>
									</div>
									<div class="form-group">
										<label>스토리</label>
										<textarea class="form-control" rows="8" name='content'></textarea>
									</div>
			
								<div class="form-group border " style="min-height: 200px;">
									<div>
										<label><strong>제작</strong></label>
									</div>

										<!-- directorList -->
										<div class="row">
											<c:forEach var="director" items="${directorList}">
												<div class="col-2">
													<input class="form-check-input" type="checkbox"	name="directorList" value="<c:out value="${director.dirBno}" />">
													<div class="container-fluid justify d-flex flex-row mb-3">
														<div class="card col-lg-4 Small shadow" style="width: 10rem; margin-right: 5px;">
															<c:choose>
																<c:when test="${not empty director.imgList}">
																	<c:set var="uploadPath"
																		value="${fn:replace(director.imgList[0].uploadPath, '\\\\', '/')}" />
																	<c:set var="imagePath"
																		value="${uploadPath}/${director.imgList[0].uuid}_${director.imgList[0].fileName}" />
																	<c:url var="imageUrl" value="/director/download" />
																	<img
																		src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"
																		class="img-fluid rounded-top w-100" alt="">
																</c:when>
																<c:otherwise>
																	<!-- 이미지가 없는 경우 대체 내용 추가 -->
																	<p>이미지가 없습니다.</p>
																</c:otherwise>
															</c:choose>
															<div class="card-body">
																<h5 class="card-title">
																	<span>${director.dirName }</span>
																</h5>
																<p class="card-text">${director.age }</p>
																<p class="card-text">${director.dirBirth }</p> 
																<span>(평점 4.5/5.0)</span>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>

									<!-- actorList -->
									<div class="form-group border " style="min-height: 200px;">
									<div>
										<label><strong>출연</strong></label>
									</div>
									<div class="row">
										<c:forEach var="actor" items="${actorList}">
											<div class="col-2">
												<input class="form-check-input" type="checkbox"	name="actorList" value="<c:out value="${actor.actbno}" />">
												<div class="container-fluid justify d-flex flex-row mb-3">
													<div class="card col-lg-4 Small shadow"	style="width: 10rem; margin-right: 5px;">
														<c:choose>
															<c:when test="${not empty actor.imgList}">
																<c:set var="uploadPath"
																	value="${fn:replace(actor.imgList[0].uploadPath, '\\\\', '/')}" />
																<c:set var="imagePath"
																	value="${uploadPath}/${actor.imgList[0].uuid}_${actor.imgList[0].fileName}" />
																<c:url var="imageUrl" value="/actor/download" />
																<img
																	src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"
																	class="img-fluid rounded-top w-100" alt="">
															</c:when>
															<c:otherwise>
																<!-- 이미지가 없는 경우 대체 내용 추가 -->
																<p>이미지가 없습니다.</p>
															</c:otherwise>
														</c:choose>
														<div class="card-body">
															<h5 class="card-title">
																<span>${actor.name }</span>
															</h5>
															<p class="card-text">${actor.age }</p>
															<%-- 	<p class="card-text">${actor.bDate }</p> --%>
															<span>(평점 4.5/5.0)</span>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<div id="uploadedImages3" class="carousel slide carousel-fade" data-bs-ride="carousel">
					        		<div class="carousel-inner" id="carousel-inner3" style="width:100%;height:auto;">
										<div id="drop-area3" style="width:100%;">
											<p>이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.</p>
							        	</div>
					        		</div>
					        		<button class="carousel-control-prev" type="button" data-bs-target="#uploadedImages3" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button" data-bs-target="#uploadedImages3" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
									<button type="button" class="carousel-control-add" id="uploadImage3" data-bs-target="#uploadedImages3">
										<span class="bi bi-file-plus fz20" aria-hidden="true"></span>
										<span class="visually-hidden">Add</span>
									</button>
									<button type="button" class="carousel-control-remove" id="deleteImage3" data-bs-target="#uploadedImages3">
										<span class="bi bi-file-x fz20" aria-hidden="true"></span>
										<span class="visually-hidden">Remove</span>
									</button>
					        	</div>
								</div>
							</form>
			
									<div class="row">
										<div class="col-4">	<button type="submit" class="border btn btn-primary w-100 text-white">추가</button></div>
										<div class="col-4">	<button type="reset" class="border btn btn-primary w-100 text-white">초기화</button></div>
										<div class="col-4"><a href="/movies/movieList" class="border btn btn-primary w-100 text-white">돌아가기</a></div>
									</div>
								</div>
						</div>
					</div>
					<!--  end panel-body -->
				</div>
				<!-- /.row -->
		    </div>
		   	<!-- ./ Outer Row -->
		</div>
	</div>
<script src="/resources/js/movie.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>