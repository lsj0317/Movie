<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="container  pt-6">
    <div class="card o-hidden border-0 shadow-lg my-3">
        <div class="card-body p-2">
			<div class="row justify-content-center">
				<div class="row justify-content-center">
					<div class="col-lg-12">
						<h4 class="color00b0f0">배우 등록</h4>
						<div class="row justify-content-center">
							<input type="file" name="imgList" id="file-input" accept="image/*" style="display: none;" multiple>
							<form role="form" action="/actor/register" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value = "${_csrf.token}"/>
								<div class="row justify-content-center">
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
								        	<div class="row row-cols-2 p-3">
												<label class="col-sm-2 text-align-center">이름</label>
												<div class="col-sm-10">
													<input class="form-control" name='name'>
												</div>
											</div>
											<div class="row row-cols-2 p-3">
												<label class="col-sm-2 text-align-center">나이</label>
												<div class="col-sm-10">
													<input class="form-control" name='age' id="Age" readonly>
												</div>
											</div>
											<div class="row row-cols-2">
												<div class="form-group text-align-center">
													<label>출생년도</label>
												</div>
												<div class="form-group text-align-center d-flex">
													<label style="margin-right: 3px;">사망년도</label>
													<input type="checkbox" id="ripYear" onclick="ripCheck(event)">
												</div>
												<div class="form-group p-3">
													<input type="date" class="form-control" name="birDate" id="date1" onchange="insertBirth()">
													<input type="hidden" id="hiddenInput">
												</div>
												<div class="form-group p-3">
													<input type="date" class="form-control" name="deaDate" id="date2" disabled="disabled">
												</div>
											</div>
										</div>
							        </div>
								</div>
								<div class="row">
									<hr class="mt-2 mb-2">
									<div class="col-4">
										<button type="submit" id="submit" class="btn btn-primary w-100">추가하기</button>
									</div>
									<div class="col-4">
										<button type="reset" class="btn btn-primary w-100">초기화</button>
									</div>
									<div class="col-4">
										<a href="/movie/movieList" class="btn btn-primary w-100">돌아가기</a>
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