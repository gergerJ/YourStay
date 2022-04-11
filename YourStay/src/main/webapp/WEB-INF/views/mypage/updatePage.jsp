<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="javascript/jquery-3.2.1.min.js"></script>
<script src="javascript/jquery-ui.js"></script>
<script src="javascript/jquery-ui.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/airDnDCSS.css?ver=3"> 
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="../css/blog.css" type="text/css" media="all" />
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.joinForm {
  align:center;
  width: 1200px;
  padding: 3% 3% 3% 3%;
  margin: auto;
  background: white;
  padding-left: 0%;
  padding-right: 15%;
}
.form {
	
  align:center;
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 900px;
  margin: 0 auto 100px;
  padding: 45px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}


.form input[type=text],input[type=password] {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 60%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form input[type=button] {
  align:center;
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  width: 200px;
  border: 0;
  padding: 15px 15px 15px 15px;
  background-color: #FF5A5F;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}

.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}

</style>

<script type="text/javascript">

$(function(){   
	// 비밀번호 숫자 + 영어 대/소문자 + 특수문자 합쳐서 8 ~ 16자로 지정가능 표현식
	$('#mpwd').on("keyup"  , function(){
	   let btn = document.querySelector('#updateBtn'); //수정버튼 
       let pwdval =  $('#mpwd').val(); // 입력된 pwd값
       let pcheck1 = /(?=.*?[a-z])(?=.*?[A-Z])/;  // 영어 대/소 문자 포함
       let pcheck2 = /(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/;  // 숫자 + 특수문자
       let pcheck3 = /^.{8,16}$/;  // 길이체크
       if(pcheck1.test(pwdval) && pcheck2.test(pwdval) && pcheck3.test(pwdval)){
          $('#messagespwd').text("비밀번호 사용이 가능합니다!!");
          $('#messagespwd').css( "color", "aqua" );
          $('#messagespwd').css('font-weight' ,  "bold");
          btn.disabled = false;//수정버튼 활성화여부 설정
       } else {
          $('#messagespwd').text("비밀번호는 숫자+영문 대/소문자 +특수문자를 각각 1개 이상 넣어야 합니다!");
          $('#messagespwd').css( "color", "red" );
          $('#messagespwd').css('font-weight' ,  "bold");
          btn.disabled = true;//수정버튼 활성화여부 설정
       }            
    });
 });   
 


$(document).ready(function(){
	$(".updateBtn").click(function(){
        // 태크.val() : 태그에 입력된 값
        // 태크.val("값") : 태그의 값을 변경 
        var userPw = $("#mpwd").val();
        var userEmail = $("#memail").val();
        var userMcallnum = $("#mcallnum").val();
        if(userPw == ""){
            alert("이메일를 입력하세요.");
            $("#password").focus();
            return;
        }
        if(userPw != $('#mpwd_re').val()){
        	alert("두 비밀번호가 다릅니다")
        	return;
        }
        // 폼 내부의 데이터를 전송할 주소
        document.userInfo.action="updateUser.do"
        // 제출
        document.userInfo.submit();
    });
	
	$(".cancelBtn").click(function(){
		location.href = "/home";
	});
	
	var checkShow = false;
	$("#rollDown").hide();
	$("#tempImg").click(function(){
		if(checkShow == false){
			$("#rollDown").show();
			checkShow = true;
		}else{
			$("#rollDown").hide();
			checkShow = false;
		}

	});
	
});
</script>
 

</head>
<body class="body">
<header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="/">YourStay</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="link-secondary" href="#" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
        </a>
        <a class="btn btn-sm btn-outline-secondary" href="login/loginPage">Sign up</a>
      </div>
    </div>
  </header>
	<div id="body">
		
		<div class="joinForm">
			<form name="userInfo" class="form" method="post" action="/updateUser.do">
				<input type="hidden" name="mseq" value="${findMember.mseq}">
				<table width="100%">
					<tr height="2" bgcolor="#2AC1BC">
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="mname" id="mname" value="${findMember.mname}" readonly></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type='text' name="memail" id="memail" value="${findMember.memail}" readonly> ex)ya63kr@nate.com
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" name="mpwd" id="mpwd" > 영문(대/소)+숫자+특수문자 포함 8 ~ 16자
							<div>
				                <p class="text-center mt-3" id="messagespwd"></p>
				            </div>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="mpwd_re" id="mpwd_re" ></td>
					</tr>
					
					<tr>
						<th>핸드폰 번호</th>
						<td><input type="text" class="mcallnum" name="mcallnum" id="mcallnum"  ></td>
					</tr>
					<tr height="2" bgcolor="#2AC1BC">
						<td colspan="2"></td>
					</tr>
				  </table>
				  <table style=" width:100%;  margin: auto; text-align: center;">
				  	<tr>
						<td style="text-align: 'center';"><input type="button" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important; font-size: 1rem; margin-top: 2px;" class="updateBtn btn btn-secondary" id="updateBtn" value="수정완료" ></td>
				
						<td style="text-align: 'cetner';">
							<!-- <input type="button" style="color:#fff;background-color: #2AC1BC;" class="cancelBtn" value="취소"onclick="goIndexForm()"> -->
							<a class="btn btn-secondary" type="submit" href="/mypage/home?memail=${findMember.memail}" style="background-color: #2AC1BC!important;border-color: #2AC1BC!important; width: 200px; height:51px; padding: 0.7rem 0.75rem; "> 취소</a>
						</td>
					</tr>
				  </table>								
				</form>
			</div>
		<c:if test="${msg == 'fail'}">
			<script type="text/javascript">
				alert("email 중복");
			</script>
		</c:if>
	</div>
	<footer class="blog-footer">
	  <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
	  <p>
	    <a href="#">Back to top</a>
	  </p>
	</footer>
</body>
</html>