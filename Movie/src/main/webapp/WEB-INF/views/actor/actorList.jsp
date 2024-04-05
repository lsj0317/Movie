<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container  pt-6">
    <div class="card o-hidden border-0 shadow-lg my-3">
        <div class="card-body p-2 row justify-content-center">
        	<!-- 셀 형식 -->
        	<sec:authorize access="hasAnyRole('ROLE_MANAGER','ROLE_ADMIN')">
	        	<div class="col">
					<a href="/actor/register" class="btn btn-primary">등록하기</a>
				</div>
        	</sec:authorize>
        	<div class="row g-5 justify-content-center">
	        	<c:forEach items="${ actorList}" var="actor">
	                <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.1s">
	                    <div class="service-item rounded">
	                       <div class="service-img rounded-top">
	                       		<c:choose>
								    <c:when test="${not empty actor.imgList}">
								        <c:set var="uploadPath" value="${fn:replace(actor.imgList[0].uploadPath, '\\\\', '/')}"/>
										<c:set var="imagePath" value="${uploadPath}/${actor.imgList[0].uuid}_${actor.imgList[0].fileName}"/>
										<c:url var="imageUrl" value="/actor/download"/>
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
	                                <h6 class="mb-4">name : ${actor.name } 님</h6>
	                                <h6 class="mb-4">age : ${actor.age } 세</h6>
	                                
									<fmt:formatDate value="${actor.birDate}" pattern="yy-MM-dd"/>
	                                <%-- <c:if test="${not empty actor.bDate}">
									    <h6 class="mb-4">
									        birthDay : <fmt:formatDate value="${actor.bDate}" pattern="yyyy-MM-dd" />
									        <img width="20" height="20" src="https://img.icons8.com/ios-glyphs/30/birthday-cake--v1.png" alt="birthday-cake--v1"/>
									    </h6>
									</c:if> --%>
	                                <div class="row">
	                                	<div class="col-6">
	                                		<a href="/actor/modify/${actor.actbno }" class="btn btn-primary text-white">Modify</a>
	                                	</div>
	                                	<div class="col-6">
	                                		<a href="/actor/delete/${actor.actbno }" class="btn btn-danger text-white">Delete</a>
	                                	</div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
    	    	</c:forEach>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>