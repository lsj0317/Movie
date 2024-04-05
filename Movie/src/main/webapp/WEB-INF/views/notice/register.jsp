<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>

 div, textarea{
 width:100%;
 
 }
.red{
	border: 1px solid red;
	
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
	width:100%;
	min-height:46px;
}
.noti .option_area .title_checkox{
	width:7%;
	flex-wrap: wrap;
	margin-top:5px;
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
	height:220px;
	width:100%;
}
.noti .file_upload{
	text-align:center;
	height:50px;
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
			<h3 class="page-header">공지 사항 등록</h3>
		</div>
		<!-- end col-lg-12 -->
	</div>
	<div class="row">
		<form role="form"action="/notice/register" method="post" 
			class="col-lg-12 ">
			<input type="hidden" name="${_csrf.parameterName}" value = "${_csrf.token}"/>
			
		
			<div class="border">
				<div class="group_area ">
					<div class="title_area">
						<label>글쓴이</label>
					</div>
					<div class="option_area">
							<input class="border title_inputarea" style="width:100%"name='writer' 
							value='<c:out value=""/>'>
						<!-- 없으면 db에서 글쓴이가 not null이라 오류생긴다. -->
					</div>
				</div>

				<div class="group_area ">
					<div class="title_area">
						<label>제목</label>
					</div>
					<div class="option_area">
						<div class="title_checkox">
							<input type="checkbox" name="important" checked /> <label
								for="important"> 중요</label>
						</div>

						<input class="border title_inputarea" name='title'>
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
						<textarea class="border " rows="8" name='content'></textarea>
					</div>


				</div>
			</div>

			<button type="submit" class="border btn btn-default">등록하기</button>
			<button type="reset" class="border btn btn-default">뒤로가기</button>
		</form>
		<!-- end col-lg-12 -->

	</div>
	<!-- end row -->

</div>
<!-- 콘테이너 -->

<script>
$(document).ready(function(e){
	
	
});

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>