<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>

</style>

<input type="hidden" name="${_csrf.parameterName}" value = "${_csrf.token}"/>
<div class="container  pt-6">
    <div class="card o-hidden border-0 shadow-lg my-3">
        <div class="card-body p-2 row justify-content-center">
        	<!-- 셀 형식 -->
        <!-- 	<div class="col">
				<a href="/actor/register" class="btn btn-primary">등록하기</a>
			</div> -->
        	<div class="row g-5 justify-content-center">
        		<sec:authorize access="hasAnyRole('ROLE_MANAGER','ROLE_ADMIN')">
	        		<div class="row">
	        			<a href="/movies/register" class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2" style="width: 10%; position: right;">영화등록</a>
	        		</div>
        		</sec:authorize>
	        	<c:forEach items="${movieList}" var="movies">
	                <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.1s">
	                    <div class="service-item rounded">
	                       <div class="service-img rounded-top">
	                       		<c:choose>
								    <c:when test="${not empty movies.imgList}">
								        <c:set var="uploadPath" value="${fn:replace(movies.imgList[0].uploadPath, '\\\\', '/')}"/>
										<c:set var="imagePath" value="${uploadPath}/${movies.imgList[0].uuid}_${movies.imgList[0].fileName}"/>
										<c:url var="imageUrl" value="/movies/download"/>
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
	                                <h5 class="mb-4">${movies.title}</h5>
	                                <div class="text-truncate text-overflow">
	                                <p class="mb-4">${movies.content}</p>
	                                </div>
	                                <a href="/movies/getMovie/${movies.movBno }" class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">Read More</a><br>
	                              
									<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
										
			                                <a href="/movies/modify/${movies.movBno }" class="border btn btn-primary rounded-pill text-white">수정</a>
			                                <a href="/movies/remove/${movies.movBno }" class="border btn btn-danger rounded-pill text-white">삭제</a>
			                                
	                              	</sec:authorize>
	                                
	                              <%--  <button type="button" class="border btn btn-danger rounded-pill text-white" onclick="deleteMovie(${movies.movBno })">삭제</button> --%> 
	                            </div>
	                        </div>
	                    </div>
	                </div>
    	    	</c:forEach>
			</div>
		</div>
	</div>
</div>



<script>
/* function deleteMovie(movBno) {
    console.log(movBno);
    if (confirm('정말로 삭제하시겠습니까?')) {
        fetch(`/movies/remove/${movBno}`, { 
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('input[name="_csrf"]').value
            }
        })
        .then(response => {
            if (response.ok) {
                // 삭제 성공 시 처리할 작업
                console.log('영화 삭제 성공');
                location.reload();
            } else {
                // 삭제 실패 시 처리할 작업
                throw new Error('영화 삭제 실패');
            }
        })
        .catch(error => {
            // 오류 발생 시 처리할 작업
            console.error(error);
        });
    }
} */

function deleteMovie(movBno) {
    console.log(movBno);
    if (confirm('정말로 삭제하시겠습니까?')) {
        fetch(`/movies/remove/${movBno}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('input[name="_csrf"]').value
            }
        })
        .then(response => {
            if (response.ok) {
                // 삭제 성공 시 처리할 작업
                console.log('영화 삭제 성공');
                location.reload();
            } else {
                // 삭제 실패 시 처리할 작업
                throw new Error('영화 삭제 실패');
            }
        })
        .catch(error => {
            // 오류 발생 시 처리할 작업
            console.error(error);
        });
    }
}



</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>