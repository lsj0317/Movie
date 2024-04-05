<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>

 div, textarea{
 width:100%;
 
 }
.red{
	border: 1px solid red;
	
}
.border_none{
	border:none;
}
.flex_center{
	display : flex;
	justify-content : center;
	align-items : center;
	text-align:center;
}
.flex{
	display : flex;
}
.top-block{
	height: 174px;
	}
.noti .title_area{
	background-color: #eaeaea;
	display : flex;
	justify-content : center;
	align-items : center;
	width:85px;
}
.noti .option_area{
	display:flex;
}

.noti .group_area{
	display:flex;
	width:93%;
	min-height:46px;
}
.noti .option_area .title_checkox{
	width:7%;
	flex-wrap: wrap;
	margin-top:5px;
	display:inline-block;
}
.noti .option_area .title_inputarea{
	width:93%;
	flex-wrap: wrap;
	margin-top:5px;
}
.noti .upload_area{
	width:100%;
}
.noti .file_expanded{
	height:300px;
}

.noti .file_drag{
	height:240px;
	width:100%;
}
.noti .file_upload{
	text-align:center;
	height:60px;
}
.noti .file_upload button{
	margin-top:2px;
	font-size:20px;
}
.noti .upload_icon{
width:26px;
height:26px;
}
 .noti .option_area{
padding: 10px 10px 0 10px;
}
</style>


<div class="container noti">
	<!-- 바디영역 : 컨테이너 -->
	<div class="top-block">
		<!-- header에 가지리않기 위한 블록 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				공지 사항 수정(#
				<c:out value="${notice.bno}" />
				)
			</h3>
		</div>
		<!-- end col-lg-12 -->
	</div>
	<div class="row">
		<form role="form" action="/notice/modify" method="post" class="col-lg-12 ">
			<input type="hidden" name="${_csrf.parameterName}" value = "${_csrf.token}"/>
			<input type='hidden' name='bno' value='<c:out value="${notice.bno}"/>' readonly="readonly">
			 
			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
			<!-- Criteria를 Model에서 사용하기 때문에 추가 -->

			<div class="border">
				<div class="group_area ">
					<div class="title_area">
						<label>제목</label>
					</div>
					<div class="option_area">
						<div class="title_checkox">
							<input type="checkbox" name="important" checked /> <label
								for="important"> 중요</label>
						</div>

						<input class="border title_inputarea" name='title'
							value='<c:out value="${notice.title}"/>'>

					</div>
				</div>
				<div class="group_area ">
					<div class="title_area border-bottom">
						<label>글쓴이</label>
					</div>
					<div class="option_area border-bottom">
						<input class="border_none" name='writer'
							value='<c:out value="${notice.writer}"/>' readonly="readonly">
					</div>
				</div>
				<div class="group_area file_expanded">
					<div class="title_area">
						<label>첨부파일</label>
					</div>
					<div class="option_area">

						<div class="border">
							<div class="file_drag flex_center ">
								<div class="flex">
									<div><img class="" src="/resources/img/icon/icon_FileAddTwoTone.svg">마우스로 파일을 끌어 놓으세요.</div>
								</div>

							</div>
							<div class="border file_upload">
								<button class="border btn">
								<img class="upload_icon" src="/resources/img/icon/icon_DownloadOutlined.svg">내PC</button>
							</div>
						</div>

					</div>
				</div>

				<div class="group_area content">
					<div class="title_area">
						<label>내용</label>
					</div>
					<div class="option_area">
						<textarea class="border " rows="8" name='content'><c:out
								value="${notice.content}" /></textarea>
					</div>
				</div>
			</div>


			<div class="group_area ">
				<div class="title_area border-bottom">
					<label>등록일</label>
				</div>
				<div class="option_area border-bottom">
					<input class="border_none" name='regDate'
						value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${notice.regdate}"/>'
						readonly="readonly">
				</div>
			</div>
			<div class="group_area ">
				<div class="title_area border-bottom">
					<label>수정일</label>
				</div>
				<div class="option_area border-bottom">
					<input class="border_none" name='updateDate'
						value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${notice.updateDate}"/>'
						readonly="readonly">
				</div>
			</div>

			<button type="submit" data-oper='modify' class="border btn btn-default">등록하기</button>
			<button type="submit" data-oper='remove' class="border btn btn-danger">삭제하기</button>
			<button type="submit" data-oper='list' class="border btn btn-info">뒤로가기</button>
		
		</form>
		<!-- end col-lg-12 -->

	</div>
	<!-- end row -->

</div>
<!-- 콘테이너 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jquery footer에 넣어져있는저 적용안된다 이유는 모름 -->
<script type="text/javascript">
	
	$(document).ready(function() {

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/notice/remove");

			} else if (operation === 'list') {
				//move to list
				formObj.attr("action", "/notice/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();

				formObj.empty();

				formObj.append(pageNumTag);
				formObj.append(amountTag);
			}
			formObj.submit();
		});
	});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>