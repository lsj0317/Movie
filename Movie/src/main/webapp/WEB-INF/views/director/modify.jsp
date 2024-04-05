<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="container  pt-6">
	<div class="card o-hidden border-0 shadow-lg my-3">
		<div class="card-body p-2">
			<div class="row justify-content-center">
				<div class="row justify-content-center">
					<div class="col-lg-12">
						<c:set value="${dirVo}" var="Director"></c:set>
						<h4 class="color00b0f0">
							director -
							<c:out value="${Director.dirName }"></c:out>
						</h4>
						<div class="row justify-content-center">
							<input type="file" name="imgList" id="file-input" accept="image/*" style="display: none;" multiple>
							<form role="form" action="/director/modify/${Director.dirBno}" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<input type="hidden" name="dirBno" value="${Director.dirBno}"/>
								<div class="row justify-content-center">
									<div class="col-4">
										<div id="uploadedImages" class="carousel slide carousel-fade" data-bs-ride="carousel" style="width:90%; height: 90%">
							        		<div class="carousel-inner" style="width:100%; height: 100%">
												<c:forEach items="${Director.imgList}" var="img" varStatus="i" begin="0">
													<c:choose>
													    <c:when test="${not empty img}">
													    	<c:choose>
													    		<c:when test="${ i.index == 0 }">
													    			<div class="carousel-item active">
													    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
																		<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
																		<c:url var="imageUrl" value="/director/download"/>
																		<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
													    			</div>
													    		</c:when>
													    		<c:otherwise>
													    			<div class="carousel-item">
													    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
																		<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
																		<c:url var="imageUrl" value="/director/download"/>
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
											<div class="row row-cols-2 p-3">
												<label class="col-sm-2 text-align-center">이름</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" name='dirName' id="dirName" value='<c:out value="${Director.dirName}"/>'/>
												</div>
											</div>
											<div class="row row-cols-2 p-3">
												<label class="col-sm-2 text-align-center">나이</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" name='age' id="Age" value='<c:out value="${Director.age}"/>' readonly>
												</div>
											</div>
											<div class="row row-cols-2">
												<div class="form-group text-align-center">
													<label>출생년도</label>
												</div>
												<div class="form-group text-align-center d-flex">
													<label style="margin-right: 3px;">사망년도</label> <input
														type="checkbox" id="ripYear">
												</div>
												<div class="form-group p-3">
													<input type="date" class="form-control" name="dirBirth"
														id="date1" onchange="insertBirth()"> <input
														type="hidden" id="hiddenInput" disabled>
												</div>
												<div class="form-group p-3">
													<input type="date" class="form-control" name="dirDead"
														id="date2" disabled="disabled">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-4">
										<button type="submit" class="btn btn-success w-100">저장하기</button>
									</div>
									<div class="col-4">
										<button type="reset" class="btn btn-secondary w-100" >내용 지우기</button>
									</div>
									<div class="col-4">
										<a href="/director/list" class="btn btn-info w-100">돌아가기</a>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!--  end panel-body -->
				</div>
				<!-- /.row -->
			</div>
			<!-- ./ Outer Row -->
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>