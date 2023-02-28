<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   

<%@include file="../include/header.jsp"%>

<link rel="stylesheet" href="../../resources/css/Main.css">
   

	<div class = "container" style="margin-top: 100px;">
       <img src="../resources/images/baseball.jpg" width="100%" height="300px">
	<div class="container">
	

<form id="listForm" action="/qnaboard/qnalist" method="post">     
    <div class="table-group">
        <table border="1" style="width: 100%; padding: 2px;">
			<tr>
			<th>검색</th>
			<td class="table_free_cus">
                                                                                  			
				<!-- <select	name="type" data-msg="선택해주세요." required> -->
				<select name="type">
						<option value=""<c:if test="${board.type == ''}">selected="selected"</c:if>>전체검색</option>
						<option value="title"<c:if test="${board.type == 'title'}">selected="selected"</c:if>>제목</option>
						<option value="content"<c:if test="${board.type == 'content'}">selected="selected"</c:if>>내용</option>
					
				</select> 
				<input type="text" name='keyword' value='<c:out value="${ board.keyword }" />' data-msg="입력해주세요."/><!--  required -->
				<input type='hidden' name='pageNum' value='<c:out value="${ board.pageNum }" />' />
				<input type='hidden' name='amount' value='<c:out value="${ board.amount }" />' /> 
				<button class='btn btn-default' onclick="search();">검색하기</button>
			
			</td>
			<th>카테고리</th>
			<td class="table_free_cus">
				<select id="cate_num" name="cate_num">
					<option value="">--카테고리 선택--</option> 
					<c:forEach items="${cateList}" var="category">
						<option value="${category.cate_num}"<c:if test="${category.cate_num == board.cate_num}">selected="selected"</c:if>>${category.cate_kind}</option>
					</c:forEach>
				</select>
			</td>
			
			<th><button id="writeForm" class="btn btn-outline-info btn_free_cus" onclick="location.href='../qnaboard/qnaregisterProc'">작성하기</button></th>			
			
			</tr>
		</table>
     			<td>1</td>
	            <td>장혜림</td>
	            <td><i class="bi bi-lock"></i><a href="/qnaboard/qnaread">동아리관련문의입니다.</a></td>
	            <td>2</td>
	            <td>2023/01/01</td>
	            
 		<!-- 게시물 목록 테이블(표) --> 
		<table class="table table-striped" style="width: 100%;">

			<tr>
				<th>번호</th>
				<th>유형</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			
			
			<c:forEach items="${list}" var="board">
				<tr>
					<td class="align-middle align-middle text-center ">
						<c:out value="${board.bno}" />
					</td>
					<td class="align-middle align-middle ">
						<c:out value="${board.cate_kind}" />
					</td>
					<td class="align-middle align-middle"><i class="bi bi-lock"></i>&nbsp;
						<a href="/qnaboard/qnaread?bno=${board.bno }" >
							<c:out value="${board.title}" />
						</a>
					</td>
					<td class="align-middle align-middle">
						<c:out value="${board.id}" />
					</td>
					<td class="align-middle align-middle">
						<fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd" />
					</td>
				</tr>
			</c:forEach>
		</table>
    </div>
 
<!-- 페이징 처리 -->
<div class='pull-right'>
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
             <li class="paginate_button previous"><a href="${ pageMaker.startPage-1 }">Previous</a>
             </li>
           </c:if>

           <c:forEach var="num" begin="${pageMaker.startPage}"
             end="${pageMaker.endPage}">
             <li class="paginate_button ${ pageMaker.cri.pageNum == num ? "active":"" } "><a href="${ num }">${num}</a></li>
           </c:forEach>

           <c:if test="${pageMaker.next}">
             <li class="paginate_button next"><a href="${ pageMaker.endPage + 1 }">Next</a></li>
           </c:if>
	</ul>
</div>

<script type="text/javascript">
/* 게시물의 작성하기 클릭했을때 작성하기 폼으로 이동하는 이벤트 처리 */
	$("#writeForm").on("click",function(e) {
			e.preventDefault();
			actionForm
					.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
			actionForm.attr("action","../qnaboard/qnaregisterProc");
			actionForm.submit();
	});
	
	
	//페이징처리
	var listForm = $("#listForm");
	$(".paginate_button a").on("click",function(e) {
		e.preventDefault();
		//console.log("click");
		//listForm.find("input[name='pageNum']").val($(this).attr("href"));
		$("input[name='pageNum']").val($(this).attr("href"));
		listForm.submit();
	});
	
	/* 게시물의 제목을 클릭했을 떄 이동하도록 이벤트 처리 */
	$("#move").on("click",function(e) {
			e.preventDefault();
			actionForm
					.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
			actionForm.attr("action","/qnaboard/qnaread?bno=" + $("#bno").val());
			actionForm.submit();
	});
	
	//게시글 검색
	function search(){
		
	    var name;
	    
	    $( '#listForm' ).find('select, input').each(function(){

	    	if( !$(this).prop('required')){	//required 속성이 없을때

	        } else {	//required 속성이 있을때
	            if ($(this).val() == "" ) {
	            	//alert($( this ).attr( 'name' ) +"val"+ $(this).val());
	            	var msg = $(this).data("msg");
	                alert(msg);
	                //name = $( this ).attr( 'name' );
	                //fail_log += name + " is required \n";
	                
	                return false;
	            }

	        }
	    });
	    //검색할때..1부터 다시 검색해야 제대로 나오니까..1로 하는거야
	    //검색할땐 당연히 검색조건이 변경되거나 그대로 일수있으니까 1로 주는거..1~10까지 이렇게
	    $("input[name='pageNum']").val(1);
	    
		//$("#listForm").attr("action","/board/list").submit();
	}
</script>	
	
<%@include file="../include/footer.jsp"%>
