<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="custom-container">
	<!-- Outer Row -->
	<div class="row justify-content-center pt-6">
		<div class="col-xl-10 col-lg-12 col-md-9">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row justify-content-center">
						<div class="col-4 p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">movie...</h1>
							</div>
							<form class="user" method="post" action="/login">
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
								<div class="form-group">
									<input type="text" class="form-control form-control-user" id="exampleInputEmail" name="id" placeholder="Enter Your Id...">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-user" id="exampleInputPassword" name="pw" placeholder="Password">
								</div>
								<div class="form-group">
									<div class="custom-control custom-checkbox small">
										<input type="checkbox" class="custom-control-input" id="customCheck" name="remember-me">
										<label class="custom-control-label" for="customCheck">Remember Me</label>
									</div>
								</div>
								<button type="submit" class="col-sm-12 btn btn-primary btn-user btn-block">Login</button>
								<hr>
                                    <a href="index.html" class="btn btn-google btn-user btn-block">
										<i class="fab fa-google fa-fw"></i> Login with kakao
                                    </a>
                                    <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                        <i class="fab fa-facebook-f fa-fw"></i> Login with instagram
                                    </a>
                                <hr>
                               </form>
                               <div class="text-center">
                                   <a class="small" href="forgot-password.html">Forgot Password?</a>
                               </div>
                               <div class="text-center">
                                   <a class="small" href="/member/register">Create an Account!</a>
                               </div>
                           </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   	<!-- ./ Outer Row -->
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>