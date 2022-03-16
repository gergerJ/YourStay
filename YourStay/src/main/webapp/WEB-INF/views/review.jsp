<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
  <head>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Album example Â· Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">

    

    <!-- Bootstrap core CSS -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/blog.css" rel="stylesheet">
	<link href="/css/footers.css" rel="stylesheet">
	<link href="/css/features.css" rel="stylesheet">
	<link href="/css/star.css" rel="stylesheet">
	<link href="/css/file.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
     
      ratingToPercent() {
	      const score = +this.restaurant.averageScore * 20;
	      return score + 1.5;
	 }
	 
	 .star-rating {
		  display: flex;
		  flex-direction: row-reverse;
		  font-size: 2.25rem;
		  line-height: 2.5rem;
		  justify-content: space-around;
		  padding: 0 0.2em;
		  text-align: center;
		  width: 5em;
		}
		 
		.star-rating input {
		  display: none;
		}
		 
		.star-rating label {
		  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
		  -webkit-text-stroke-width: 2.3px;
		  -webkit-text-stroke-color: #2b2a29;
		  cursor: pointer;
		}
		 
		.star-rating :checked ~ label {
		  -webkit-text-fill-color: gold;
		}
		 
		.star-rating label:hover,
		.star-rating label:hover ~ label {
		  -webkit-text-fill-color: #fff58c;
		}
	 
	 /* 모형 만들기  */
	 .div-shape {
		  width: 50px;
		  height: 110px;
		  background-color: #2AC1BC;
		  border-radius: 10%;
		}
	 
	 /* label 스타일 조정 */
		.button {
		    display: flex;
		    justify-content: center;
		}
		label {
		    cursor: pointer;
		    font-size: 1em;
		}
		
		/* 못생긴 기존 input 숨기기 */
		#chooseFile {
		    visibility: hidden;
		}
	 
    </style>
    
    <!-- jquery webjars add -->
    <script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
    
    <script type="text/javascript">
    
    /*
    	//체크박스 하나만 체크되도록 하는 기능! 
	     function oneCheckbox(a){
	        var obj = document.getElementsByName("checkbox1");
	        for(var i=0; i<obj.length; i++){
	            if(obj[i] != a){
	                obj[i].checked = false;
	            }
	        }
	    } */
	    
	    const drawStar = (target) => {
    	    document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
    	}
	    
	    
	    $(document).ready(function () {
		    $( ".star_rating a" ).click(function() {
		        $(this).parent().children("a").removeClass("on");
		        $(this).addClass("on").prevAll("a").addClass("on");
		        return false;
		   });
	    });
	    
	    function changeImg1(){
	    	document.getElementById()
	    	
	    	document.getElementById("divImg1").url = "/resources/images/reservation29.jpg";
	    
	    }
	    
	    document.querySelector("#sendButton").addEventListener('click',()=>{

	        let selectFile = document.querySelector("#inputImage").files[0];

	        console.log(selectFile);

	      })
	    /* style="background-image: url(/resources/images/reservation29.jpg); height: 100%; width: 100%; border:none;" */

	    
	    /* file 기능부분 */
	    
	    var submit = document.getElementById('submitButton');
		submit.onclick = showImage;     //Submit 버튼 클릭시 이미지 보여주기
		
		function showImage() {
		    var newImage = document.getElementById('image-show').lastElementChild;
		    newImage.style.visibility = "visible";
		    
		    /* document.getElementById('image-upload').style.visibility = 'hidden'; */
		
		    document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
		}
		
		
		function loadFile(input) {
		    var file = input.files[0];	//선택된 파일 가져오기

		    //미리 만들어 놓은 div에 text(파일 이름) 추가
		    var name = document.getElementById('fileName');
		    name.textContent = file.name;

		  	//새로운 이미지 div 추가
		    var newImage = document.createElement("img");
		    newImage.setAttribute("class", 'img');

		    //이미지 source 가져오기
		    newImage.src = URL.createObjectURL(file);   

		    newImage.style.width = "70%";
		    newImage.style.height = "70%";
		    newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지를 숨긴다
		    newImage.style.objectFit = "contain";

		    //이미지를 image-show div에 추가
		    var container = document.getElementById('image-show');
		    container.appendChild(newImage);
		};
	</script>
    
  </head>
  <body>    
	<header class="blog-header py-3" style="margin-bottom: 5%;">
		<div class="row flex-nowrap justify-content-between align-items-center">
		  <div class="col-4 pt-1">
		  </div>
		  <div class="col-4 text-center">
		    <a class="blog-header-logo text-dark" href="#" style="text-decoration:none">YourTrip</a>
		  </div>
		  <div class="col-4 d-flex justify-content-end align-items-center">
		    <a class="link-secondary" href="#" aria-label="Search">
		      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
		    </a>
		    <a class="btn btn-sm btn-outline-secondary" href="login/loginPage">Sign up</a>
		  </div>
		</div>
	</header>

	<!-- 본 내용  -->
	<main class="container">
	  <h1 > <b>평가 및 후기 </b></h1>
	
	<!-- 이미지 등록부분  -->
	  <div class="container px-4 py-5" id="custom-cards">
	    <h2 class="pb-2 border-bottom">Review 이미지 등록</h2>
	
	    <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
	      <div class="col">
	        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('unsplash-photo-1.jpg');">
	          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1"  id="divImg1">
	          <button class="fw-bold" name="btn1" type="button" onclick="changeImg1()" style="color:white; border: none;background: none; margin:auto; width: 260px; height: 350px;"> 사진등록 
	           	 <img src="/resources/images/camera2.png" id="img1" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
	           </button> 
	           <!-- 이미지 처리 -->
	           <form method="post" enctype="multipart/form-data">
				    <div class="button">
				        <label for="chooseFile">
				            👉 CLICK HERE! 👈
				        </label>
				    </div>
				    <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
				</form>
	          </div>
	        </div>
	      </div>
	      
	      <!-- 수정 전  이미지 등록부분 수정 전   -->
	  <div class="container px-4 py-5" id="custom-cards">
	    <h2 class="pb-2 border-bottom">Review 이미지 등록</h2>
	
	    <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
	      <div class="col">
	        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('unsplash-photo-1.jpg');">
	          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1"  id="divImg1">
	          <button class="fw-bold" name="btn1" type="button" onclick="changeImg1()" style="color:white; border: none;background: none; margin:auto; width: 260px; height: 350px;"> 사진등록 
	           	 <img src="/resources/images/camera2.png" id="img1" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
	           </button> 
	           
	          </div>
	        </div>
	      </div>
	      
	<!-- 파일 업로드 부분 소스  -->
	
	    <div class="container">
	        <div class="image-upload" id="image-upload">
	            
	            <form method="post" enctype="multipart/form-data">
	                <div class="button">
	                    <label for="chooseFile">
	                	        👉 CLICK HERE! 👈
	                    </label>
	                </div>
	                <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
	            </form>
	
	            <div class="fileContainer">
	                <div class="fileInput">
	                    <p>FILE NAME: </p>
	                    <p id="fileName"></p>
	                </div>
	                <div class="buttonContainer">
	                    <div class="submitButton" id="submitButton">SUBMIT</div>
	                </div>
	            </div>
	        </div>
	        
	        <div class="image-show" id="image-show"></div>
	    </div>

    <script src="index.js"></script>

	<!-- 하단 글 작성 내용 시작 -->
	  <div class="my-3 p-3 bg-body rounded shadow-sm">
	    <h6 class="border-bottom pb-2 mb-0">리뷰 내용 작성</h6>
	    <div class="d-flex text-muted pt-3">
	    <div class="div-shape" >  </div>
	      <!-- <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false">
			<rect width="100%" height="100%" fill="#007bff"></rect>
			</svg> -->
	
	      <p class="pb-3 mb-0 small lh-sm border-bottom" style="margin-left: 10px">
	        <strong class="d-block text-gray-dark">@사용자 이름(자동입력)</strong><br/>
	        <textarea rows="4" cols="150" width="100%" height="auto"></textarea>
	      	
	      </p>
	    </div>
	    
	    <br/>
	    
	    <!-- 별점부분 구현 -->
		<div > <span class="border-bottom" style="margin-left:20px"> 평점 </span>
			<div class="star-rating space-x-4 mx-auto">
				
				<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
				<label for="5-stars" class="star pr-4">★</label>
				<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
				<label for="4-stars" class="star">★</label>
				<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
				<label for="3-stars" class="star">★</label>
				<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
				<label for="2-stars" class="star">★</label>
				<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
				<label for="1-star" class="star">★</label>
			</div>
		</div>
		<small class="d-block text-end mt-3">
	      <a href="#" style="text-decoration:none">상단으로 올라가기</a>
	    </small>
	  </div>
	  
	  <!-- 체크박스 부분 (사용 시 해제하기)  -->
	  <!-- <form method="get" action="form-action.html">
	      <p>Color</p>
	      <label><input type="checkbox" name="color" value="blue"> Blue</label>
	      <label><input type="checkbox" name="color" value="red"> Red</label>
	      <input name="checkbox1" type="checkbox" value="1" onclick="oneCheckbox(this);" style="zoom:1.5;"> 1 &nbsp &nbsp &nbsp
		  <input name="checkbox1" type="checkbox" value="2" onclick="oneCheckbox(this);" style="zoom:1.5;"> 2 &nbsp &nbsp &nbsp
		  <input name="checkbox1" type="checkbox" value="3" onclick="oneCheckbox(this);" style="zoom:1.5;"> 3 &nbsp &nbsp &nbsp
		  <input name="checkbox1" type="checkbox" value="4" onclick="oneCheckbox(this);" style="zoom:1.5;"> 4 &nbsp &nbsp &nbsp
		  <input name="checkbox1" type="checkbox" value="5" onclick="oneCheckbox(this);" style="zoom:1.5;"> 5 &nbsp &nbsp &nbsp
	      <p><input type="submit" value="Submit"> <input type="reset" value="Reset"></p>
	  </form> -->
	  
	</main>

	
	<!-- 푸터 -->
   <div class="container">
      <footer class="py-3 my-4">
         <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            <li class="nav-item"><a href="#"
               class="nav-link px-2 text-muted">Home</a></li>
            <li class="nav-item"><a href="#"
               class="nav-link px-2 text-muted">Features</a></li>
            <li class="nav-item"><a href="#"
               class="nav-link px-2 text-muted">Pricing</a></li>
            <li class="nav-item"><a href="#"
               class="nav-link px-2 text-muted">FAQs</a></li>
            <li class="nav-item"><a href="#"
               class="nav-link px-2 text-muted">About</a></li>
         </ul>
         <p class="text-center text-muted">© 2021 Company, Inc</p>
      </footer>
   </div>


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

      
  </body>
</html>
