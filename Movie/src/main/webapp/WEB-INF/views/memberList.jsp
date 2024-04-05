<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container  pt-6">
    <div class="card o-hidden border-0 shadow-lg my-3">
        <div class="card-body p-2 row justify-content-center">
            <!-- 테이블 형식 -->
        	<div class="row justify-content-center">
				<table class="table table-striped table-hover text-align-center align-middle" id="actorList">
					<thead>
						<tr>
							<th scope="col" class="text-center col-xs-1">멤버 번호</th>
							<th scope="col" class="text-center col-xs-2">닉네임</th>
							<th scope="col" class="text-center col-xs-2">전화번호</th>
							<th scope="col" class="text-center col-xs-1">관리자</th>
							<th scope="col" class="text-center col-xs-4">수정/삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${members}" var="member">
					        <c:choose>
					            <c:when test="${member.authList[0].auth eq 'ROLE_ADMIN'}">
					                <!-- Skip rendering for ROLE_ADMIN -->
					            </c:when>
					            <c:otherwise>
					                <tr>
					                    <td class="text-center"><span class="px-1">${member.membno}</span></td>
					                    <td ><img src="" class="bi-person-circle h2 rounded"><span class="px-1">${member.nickName}</span></td>
					                    <td >${member.phone}</td>
					                    <c:choose>
							                <c:when test="${member.authList[0].auth eq 'ROLE_MEMBER'}">
							                    <td class="align-center">
							                    	<div class="form-check form-switch d-flex justify-content-center">
							                    		<input class="form-check-input" type="checkbox" name="role" value="${member.id}" onclick="isChecked(this)" />
					                    			</div>
					                    		</td>
							                </c:when>
							                <c:when test="${member.authList[0].auth eq 'ROLE_MANAGER'}">
							                    <td class="align-center" >
							                    	<div class="form-check form-switch d-flex justify-content-center">
							                    		<input class="form-check-input" type="checkbox" name="role" value="${member.id}" onclick="isChecked(this)" checked/>
					                    			</div>
							                    </td>
							                </c:when>
							                <c:otherwise>
							                </c:otherwise>
							            </c:choose>
					                    <td class="text-align-center">
						                    <div class="container overflow-hidden">
						                        <div class="row row-cols-2">
						                        	<div class="col d-flex justify-content-center">
						                            	<button id="modify" class="col btn btn-primary gx-1">수정</button>
						                        	</div>
						                        	<div class="col d-flex justify-content-center">
							                            <button id="remove" class="col btn btn-primary gx-1" value="${member.membno}" onclick="deleteData(this)">삭제</button><!-- console.log(e.target.value); -->
						                        	</div>
						                        </div>
					                        </div>
					                    </td>
					                </tr>
					            </c:otherwise>
					        </c:choose>
					    </c:forEach>
					</tbody>
						
				</table>
        	</div>

			<form id='searchForm' action="/admin/memberList" method='get'>
				<div class='row'>
					<div class="col-lg-8">
						<div class="row row-cols-3">
							<div class="col-sm-3">
								<select name='type' class="form-select">
									<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
									<option value="N" <c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>닉네임</option>
									<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>전화번호</option>
									<option value="A" <c:out value="${pageMaker.cri.type eq 'A'?'selected':''}"/>>권한</option>
									<option value="NT" <c:out value="${pageMaker.cri.type eq 'NT'?'selected':''}"/>>닉네임 or 전화번호</option>
									<option value="NA" <c:out value="${pageMaker.cri.type eq 'NA'?'selected':''}"/>>닉네임 or 권한</option>
									<option value="NTA" <c:out value="${pageMaker.cri.type eq 'NTA'?'selected':''}"/>>닉네임 or 전화번호 or 권한</option>
								</select>
							</div>
							<div class="col-sm-7">
								<input type='text' class="form-control" name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
								<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
								<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							</div>
							<div class="col-sm-2">
								<button class='btn btn-primary'>검색</button>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						  <ul class="pagination justify-content-end">
							<c:if test="${pageMaker.prev }">
								<li class="page-item">
									<a class="page-link" href="${ pageMaker.startPage-1 }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							<c:forEach var="num" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }">
							    <li class="page-item ${ pageMaker.cri.pageNum == num ? 'Active':'' }"><a class="page-link" href="${ num }" >${ num }</a></li>
							</c:forEach>
							<c:if test="${pageMaker.prev }">
								<li class="page-item">
									<a class="page-link" href="${ pageMaker.endPage+1 }" aria-label="Previous">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
						  </ul>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>