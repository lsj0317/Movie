<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="kr">

    <head>
    	<link rel="shortcut icon" href="#">
        <meta charset="utf-8">
        <title>Watcha Pedia</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <sec:csrfMetaTags/>
		<sec:authentication property="principal" var="pinfo"/>
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">  

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="/resources/lib/animate/animate.min.css" rel="stylesheet">
		<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

		<!-- owlCarousel -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css"/>

        <!-- Customized Bootstrap Stylesheet -->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/resources/css/style.css" rel="stylesheet">
        <link href="/resources/css/common.css" rel="stylesheet">
        
        <style type="text/css">
        
        	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
        
        	* {
        		font-family: "Noto Sans KR", sans-serif!important;
        	}
        
        	@font-face {
			    font-family: 'TTLaundryGothicB';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/2403-2@1.0/TTLaundryGothicB.woff2') format('woff2');
			    font-weight: 700;
			    font-style: normal;
			}
        
        	/* header logo color */
        	.headerTextColor {
        		font-size: 50px;
				  font-weight: bolder;
				  background-image: linear-gradient(to right, blue, skyblue);
				  background-clip: text;
				  -webkit-background-clip: text;
				  color: transparent;
				  font-family: 'TTLaundryGothicB';
        	}
        
        	.noto-sans {
        		font-size: 20px!important;
        		font-family: "Noto Sans KR", sans-serif!important;
        	}
        
        </style>
        
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading/resources.</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->
        <div class="container-fluid position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light bg-white px-4 px-lg-5 py-3 py-lg-0">
                <a href="/home" class="navbar-brand p-0">
                    <h1 class="m-0 headerTextColor">Enjoy Movie</h1>
                    <!-- <img src="/resources/img/sources/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="/movies/list" class="nav-item nav-link noto-sans">영화</a>
                        <a href="/actor/list" class="nav-item nav-link noto-sans">배우</a>
                        <a href="/director/list" class="nav-item nav-link noto-sans">감독</a>
                        <a href="/notice/list" class="nav-item nav-link noto-sans">공지사항</a>
                        <sec:authorize access="!isAuthenticated()">
                        	<a href="/loginAuth" class="nav-item nav-link noto-sans" id="login">로그인</a>
                        </sec:authorize>
                        <sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_MANAGER')">
                        	<div class="nav-item dropdown" id="information">
	                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">회원정보</a>
	                            <div class="dropdown-menu m-0">
	                                <a href="/member/update" class="dropdown-item">회원 정보 수정</a>
	                                <button class="dropdown-item" onclick="logout()">LogOut</button>
	                            </div>
	                        </div>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
	                        <div class="nav-item dropdown" id="admin">
	                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">관리하기</a>
	                            <div class="dropdown-menu m-0">
	                                <a href="/admin/memberList" class="dropdown-item">멤버 관리</a>
	                                <button class="dropdown-item" onclick="logout()">LogOut</button>
	                            </div>
	                        </div>
                        </sec:authorize>
                        <sec:authorize access="!isAuthenticated()">
                        	<a href="/member/register" class="nav-item nav-link noto-sans" id="register">회원가입</a>
                        </sec:authorize>
                    </div>
                    <!-- <a href="#" class="btn btn-primary rounded-pill text-white py-2 px-4 flex-wrap flex-sm-shrink-0">예매하기</a> -->
                </div>
            </nav>
        </div>
        <!-- Navbar & Hero End -->