<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container  pt-6">
    <div class="card o-hidden border-0 shadow-lg my-3">
        <div class="card-body p-2 row justify-content-center">
        	<div class="col">
        		<h5>DirectorList</h5>
        	</div>
        	<!-- 셀 형식 -->
        	<sec:authorize access="hasAnyRole('ROLE_MANAGER','ROLE_ADMIN')">
	        	<div class="col">
					<a href="/director/register" class="btn btn-primary">추가하기</a>
				</div>
			</sec:authorize>
        	<div class="row g-5 justify-content-center">
	        	<c:forEach items="${ directorList}" var="director">
	                <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.1s">
	                    <div class="service-item rounded">
	                       <div class="service-img rounded-top">
	                       		<c:choose>
								    <c:when test="${not empty director.imgList}">
								        <c:set var="uploadPath" value="${fn:replace(director.imgList[0].uploadPath, '\\\\', '/')}"/>
										<c:set var="imagePath" value="${uploadPath}/${director.imgList[0].uuid}_${director.imgList[0].fileName}"/>
										<c:url var="imageUrl" value="/director/download"/>
										<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>" class="img-fluid rounded-top w-100" alt="">
								    </c:when>
								    <c:otherwise>
								        <!-- 이미지가 없는 경우 대체 내용 추가 -->
								        <img src="../resources/img/image-not-found-icon.png" class="card-img-top" alt="">
								    </c:otherwise>
								</c:choose>
	                       </div>
	                        <div class="service-content rounded-bottom bg-light p-4">
	                            <div class="service-content-inner">
	                                <h5 class="mb-4">${director.dirName }</h5>
	                                <p class="mb-4">${director.age }</p>
	                               
	                                	<a href="/director/modify/${director.dirBno }" class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">Modify</a>
	                                	<a href="/director/delete/${director.dirBno }"button type="submit" id="submit" class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2" >Delete</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
    	    	</c:forEach>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">




});

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>




