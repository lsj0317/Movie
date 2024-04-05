<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div>
        <h4>별점주기 - ver.1</h4>
        <span class="star">
            <!-- 기존 별 -->
            ★★★★★
            <!-- 체크하면 나타날 별 -->
            <span>★★★★★</span>
            <!-- 별점 체크를 위한 input(hidden) -->
            <input id="inputVal" type="range" oninput="checkStar(this)" value="0.0" step="0.5" min="0" max="5">
        </span>
        <div class="avg-txt">
            평점 : <span id="score">0.0</span> / 5.0
            <!-- 평점 숫자 출력되는 부분 -->
        </div>
    </div>

    <br>

    <div>
        <h4>별점주기 - ver.2</h4>
        <div class="star-rating">
            <div class="starts">
                <i class="fa fa-star fz20"></i>
                <i class="fa fa-star fz20"></i>
                <i class="fa fa-star fz20"></i>
                <i class="fa fa-star fz20"></i>
                <i class="fa fa-star fz20"></i>
            </div>
            <div class="print">
                <span class="score"></span>점 / 5점 <span class="comment">점수없음</span>
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>