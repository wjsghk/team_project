/*!
* Start Bootstrap - Landing Page v6.0.5 (https://startbootstrap.com/theme/landing-page)
* Copyright 2013-2022 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-landing-page/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project


$(document).ready(function(){
   
   $("#bestview").show();
   $("#newview").hide();

   $("#best").on("click" , function(){
      $("#bestview").show();
      $("#newview").hide();
      console.log("click!");
   });
   
   $("#new").on("click" , function(){
      $("#newview").show();
      $("#bestview").hide();
      console.log("click!");
   });
});

// $(function(){
// 	$(document).one('click', '.like-review', function(e) {
// 		$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> You liked this');
// 		$(this).children('.fa-heart').addClass('animate-like');
    
// 	});
// });
//menu_introduce의 detail 좋아요 버튼
$(function () {
  $('.like-review').on('click', function (e) {
      $(this).children('.fa-heart').toggleClass('animate-like');

  });
});

/*로그인 알람*/ 

   
    var signbtn = document.getElementById("signbtn") // 버튼을 만들고.
    signbtn.addEventListener('click', signinFunc) // 'click'이란 id의 버튼을 누르면 signinFunc 함수를 실행.

    function signinFunc () {
      var userid = document.getElementById("user_id").value; // userid 의 값을 받아와 넣음.
      var userpw = document.getElementById("user_password").value; // userpw 의 값을 받아와 넣음.


      if(userid == "abcd" && userpw == "1234") {
        alert("로그인 성공");
        console.log("로그인 성공했습니다.");
      } else {
        alert("로그인 실패");
        console.log("로그인 실패했습니다.");
      }


    }

