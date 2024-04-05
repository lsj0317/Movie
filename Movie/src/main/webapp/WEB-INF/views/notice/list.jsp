<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script src="http://code.jquery.com/jquery-latest.js"></script> 
<style>
.page_active {
	background-color: #87CEEB;
	/* 79라인 ative 대신 배경 컬러를 넣어준다. */
}
.flex_between{
	display : flex;
	justify-content:space-between;
}
.red{
	border: 1px soild red;
	
}
.top-block{
	height: 174px;
	}

</style>


<div class="container ">
	<!-- 바디영역 : 컨테이너 -->
	<div class="top-block">
		<!-- header에 가지리않기 위한 블록 -->
	</div>
	<div class="row ">
		<div class="col-lg-12 flex_between">
			<h3 class="page-header">공지 사항</h3>
			<button id='regBtn' type="button" class="border btn">새글 등록</button>
			
		</div>
		<!-- end col-lg-12 -->
	</div>
	<div class="row mt-3">
		<div class="col-lg-12">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>등록일</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="board"><!-- board는 java의 메소드와 반드시는 일치시킬필요없음 -->
						<tr>
							<td><c:out value="${board.bno}" /></td>
							<td><a class='move' href='<c:out value="${board.bno}"/>'>
							<c:out value="${board.title}"/></a></td>
							<td><c:out value="${board.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>
						</tr>
					</c:forEach>

				</table>
				
			<div class='pull-right'>
					<ul class="pagination">

					<c:if test="${pageMaker.prev}">
             			 <li class="btn paginate_button previous">
             			 <a href="${pageMaker.startPage -1 }">Previous</a>
           			   </li>
           			 </c:if>

           			 <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
           			   <li class="btn paginate_button ${pageMaker.cri.pageNum == num ? "page_active":""} ">
           			   <!-- 선택한 pageNum을 배경이나 color로 장식한다. -->
						<a href="${num}">${num}</a>
						</li>
           			 </c:forEach>

           			 <c:if test="${pageMaker.next}">
            		  <li class="btn paginate_button next">
            		  <a href="${pageMaker.endPage +1 }">Next</a>
            		  </li>
           			 </c:if>

					</ul>
				</div>
				<!--  end Pagination -->
			</div>
			<form id='actionForm' action="/notice/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

				<%-- <input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> <input
					type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword }"/>'>
 --%>
			</form>
				
			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
		<!-- end col-lg-12 -->

	</div>
	<!-- end row -->
</div>
<!-- 콘테이너 -->

<script type="text/javascript">
$(document).ready(function() {
	
	var result = '<c:out value="${result}"/>';

	checkModal(result);

	history.replaceState({}, null, null);

	function checkModal(result) {

		if (result === '' || history.state) {
			return;
		}

		/* if (parseInt(result) > 0) {
			$(".modal-body").html("게시글 " + parseInt(result)+ " 번이 등록되었습니다.");
		} */

	/* 	$("#myModal").modal("show"); */
	}
	
	$("#regBtn").on("click", function() {
		self.location = "/notice/register";

	});
	
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e) {
		
		e.preventDefault();
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e) {

		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"
						+ $(this).attr("href")+ "'>");
		actionForm.attr("action","/notice/get");
		actionForm.submit();

	});
});


</script>




<%@ include file="/WEB-INF/views/common/footer.jsp" %>