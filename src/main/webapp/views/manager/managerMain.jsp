<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<style>
.section_1{
            margin: auto;
            width: 100%;
            min-height: 1100px;
            display: flex;
         }
         
         /*관리자 메인페이지*/
         .section_right{
            width: 100%;
            margin: 20px;
            margin-top: 30px;
         }
         .section_title{
            display: flex; 
            font-weight: bold; 
            font-size: 23px;
            padding-bottom: 10px;
            border-bottom: 2px solid gray;
            margin-left: 10px;
        }
        .section_title>label{
            margin-left: 10px;
        }
        .section_bottom{
            display: flex;
            flex-direction: column;
        }
        .section_bottom_1{ display: flex; margin-top: 30px;}
        .section_bottom_1>div{
            width: 100%; 
            display: flex;
            flex-direction: column; 
            justify-content: center; 
            align-items: center;
            height: 200px;
        }
        .section_bottom_2>div{
            height: 100%;
            width: 80%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 30px;
            font-weight: bold;
            background-color: rgb(241, 238, 238);
        }
        .section_mtitle{
        	font-size: 18px; 
			font-weight: bold; 
			margin-top: 30px;
	        margin-bottom: 20px; 
	        border-bottom: 
	        2px solid gray;
		}
        .table{text-align: center;}
        .section_mtitle>div{font-size: 20px; font-weight: bold;}
</style>
</head>
<body>

<div class="wrap">

        <%@ include file="/views/common/header.jsp" %>
        
        <% if(loginUser == null){ // alert 시킬 알람문구가 존재할 경우 %>
		  <script>
		     alert('로그인을 먼저 진행해주세요'); // 문자열 취급시 따옴표로 감싸야됨
		     location.href="<%=contextPath%>"
		  </script>
		<% } %>

<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
        
        <!-- Section start -->
        <section class="main-content">
            <div class="section_1">
            
            <%@ include file="/views/common/managerMenu.jsp" %>
         
        <!-- 사이드메뉴바 클릭시 바뀌는 화면-->
        <div class="section_right">
            <div class="section_title" style="border-bottom: 2px solid gray">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-house-gear-fill" viewBox="0 0 16 16">
                    <path d="M7.293 1.5a1 1 0 0 1 1.414 0L11 3.793V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v3.293l2.354 2.353a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708z"/>
                    <path d="M11.07 9.047a1.5 1.5 0 0 0-1.742.26l-.02.021a1.5 1.5 0 0 0-.261 1.742 1.5 1.5 0 0 0 0 2.86 1.5 1.5 0 0 0-.12 1.07H3.5A1.5 1.5 0 0 1 2 13.5V9.293l6-6 4.724 4.724a1.5 1.5 0 0 0-1.654 1.03"/>
                    <path d="m13.158 9.608-.043-.148c-.181-.613-1.049-.613-1.23 0l-.043.148a.64.64 0 0 1-.921.382l-.136-.074c-.561-.306-1.175.308-.87.869l.075.136a.64.64 0 0 1-.382.92l-.148.045c-.613.18-.613 1.048 0 1.229l.148.043a.64.64 0 0 1 .382.921l-.074.136c-.306.561.308 1.175.869.87l.136-.075a.64.64 0 0 1 .92.382l.045.149c.18.612 1.048.612 1.229 0l.043-.15a.64.64 0 0 1 .921-.38l.136.074c.561.305 1.175-.309.87-.87l-.075-.136a.64.64 0 0 1 .382-.92l.149-.044c.612-.181.612-1.049 0-1.23l-.15-.043a.64.64 0 0 1-.38-.921l.074-.136c.305-.561-.309-1.175-.87-.87l-.136.075a.64.64 0 0 1-.92-.382ZM12.5 14a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
                </svg>
                <label>관리자 메인페이지</label>
            </div>
            <div class="section_bottom">
                <div class="section_bottom_1">
                    <div class="section_bottom_2">
                        <div style="border-bottom: 1px solid rgb(212, 212, 212);">오늘의 방문자 수</div>
                        <div>50</div>
                    </div>
                    <div class="section_bottom_2">
                        <div style="border-bottom: 1px solid rgb(212, 212, 212);">미답변 문의</div>
                        <div>5</div>
                    </div>
                </div>
                <div class="section_mtitle">
                    <div>미답변 상품문의</div>
                </div>
                <div>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th>번호</th>
                                <th>작성일자</th>
                                <th>아이디</th>
                                <th>상품명</th>
                                <th>상품코드</th>
                                <th>상품리뷰제목</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>2</td>
                                <td>2024/02/25</td>
                                <td>user02</td>
                                <td>고추장</td>
                                <td>A2</td>
                                <td>상품입고는 언제되나요?</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>2024/02/25</td>
                                <td>user02</td>
                                <td>고추장</td>
                                <td>A2</td>
                                <td>상품입고는 언제되나요?</td>
                            </tr>
                            <td>2</td>
                                <td>2024/02/25</td>
                                <td>user02</td>
                                <td>고추장</td>
                                <td>A2</td>
                                <td>상품입고는 언제되나요?</td>
                        </tbody>
                    </table>
                </div>
                <div class="section_mtitle">
                    <div>미답변 1:1문의</div>
                </div>
                <div>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th>번호</th>
                                <th>작성일자</th>
                                <th>아이디</th>
                                <th>문의유형</th>
                                <th>문의내역</th>
                            </tr>                          
                        </thead>
                        <tbody>
                            <tr>
                                <td>6</td>
                                <td>2024/02/25</td>
                                <td>user02</td>
                                <td>배송</td>
                                <td>평균 몇일정도 걸리나요?</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>2024/02/25</td>
                                <td>user02</td>
                                <td>기타</td>
                                <td>평균 몇일정도 걸리나요?</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>2024/02/25</td>
                                <td>user02</td>
                                <td>기타</td>
                                <td>평균 몇일정도 걸리나요?</td>
                            </tr>
                        </tbody>
                        
                    </table>
                </div>
            </div>

            
            <script>

                $(function(){
                        // 전체 선택 / 해제
                    $("#cbx_chkAll").click(function(){
                        if($("#cbx_chkAll").is(":checked")){
                        $("input[name=typArr]").prop("checked", true);
                        }else {
                        $("input[name=typArr]").prop("checked", false);
                        }
                    });
                    
                    $("input[name=typArr]").click(function(){
                        var totalArr = $("input[name=typArr]").length;
                        var checked = $("input[name=typArr]:checked").length;
                        
                        if(totalArr != ckecked){
                        $("#cbx_chkAll").prop("checked", false);
                        }else{
                        $("#cbx_chkAll").prop("checked", true);
                        }
                    });

                    $(".table_title>td").each(function(){
                        if($(this).text() == "미처리"){
                            $(this).css("color", "red");
                        }else{
                            $(this).css("color", "black");
                        }
                    })
                })
                
              </script>

        </div>
    </div>

            
        </section>
        <!-- Section end -->

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

        <%@ include file="/views/common/footer.jsp" %>
 </div>
</body>
</html>