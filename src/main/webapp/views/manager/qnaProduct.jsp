<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의</title>
<style>
/*상품문의 스타일*/
     .section_right{
        width: 100%;
        margin: 20px;
        margin-top: 30px;
     }
     .section_right label{
        font-weight: bolder;
        font-size: 17px;   
     }
     .section_right>div{
        display: flex;
        
     }
     .pro_search{
        display: flex;
        margin-left: 10px;
        margin-top: 15px;
     }

     .pro_search button{
        width: 80px;
        background-color: #c20000; /* 배경색 설정 */
        color: #ffffff; /* 텍스트 색상 설정 */
        border: none; /* 테두리 제거 */
        font-weight: bold;
        height: 100%;
     }

    table{
        margin-top: 20px;
        width: 80%;
        text-align: center;
        border: 1px solid #dddddd;
     }
     td:hover{
        cursor: pointer;
     }
     
     .table_title th{
        background-color: #dddddd;;
        font-weight: bold; /* 헤더 글씨체를 굵게 설정 */
        padding: 8px; /* 셀 안의 여백 설정 */
     }

     .pro_name{
        display: flex;
        align-items: center; 
        justify-content: center;  
        background-color: #dddddd; 
        width: 100px; 
        font-weight: bold;
        border-bottom-left-radius: 10px;
        border-top-left-radius: 10px;
        border: 1px solid rgb(148, 146, 146);
        border: none; /* 테두리 제거 */
        border-radius: 5px; /* 모서리를 둥글게 만듦 */
     }

     

     .select_div{
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
        align-items: center;
        
     }
     .select_div select{
        width: 100px;
     }
     .select_delete{
        margin-right: 50px;
        height: 40px;
        width: 100px;
        background-color: #c20000; /* 배경색 설정 */
        color: #ffffff; /* 텍스트 색상 설정 */
        border: none; /* 테두리 제거 */
        border-radius: 5px; /* 모서리를 둥글게 만듦 */
        font-weight: bold;
     }
     .pagination{
        display: flex; justify-content: center; margin-top: 10px;
     }
     .table_d{display: flex; flex-direction: column;}
     .section_title b{font-size: 20px;}
</style>
</head>
<body>
<div class="wrap">

        <%@ include file="/views/common/header.jsp" %>

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
                </svg>문의관리><b>상품문의</b>
            </div>
            <div class="pro_search">
                <div class="pro_name">상품명</div>
                <div><input type="text"></div>
                <div><button>조회</button></div>
            </div>
            <div class="select_div">
                <div>
                    <select name="" id="">
                        <option value="">전체</option>
                        <option value="">장류</option>
                        <option value="">드레싱</option>
                        <option value="">기타</option>
                    </select>
                </div>
                <div class="option_2">
                    <button class="select_delete" onclick="return confirm('정말로 삭제하시겠습니까?');">선택삭제</button>
                    <select name="" id="">
                        <option value="">전체</option>
                        <option value="">처리</option>
                        <option value="">미처리</option>
                    </select>
                </div>
            </div>
            <div class="table_d">
                <div>
                    <table class="table table-hover">
                        <thead>
                            <tr class="table_title">
                                <th><input type="checkbox" id="cbx_chkAll"></th>
                                <th>번호</th>
                                <th>작성일자</th>
                                <th>아이디</th>
                                <th>상품명</th>
                                <th>상품코드</th>
                                <th>문의내역</th>
                                <th>처리결과</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="table_title">
                                <td><input type="checkbox" name="typArr"></td>
                                <td>6</td>
                                <td>2024/02/25</td>
                                <td>user02</td>
                                <td>고추장</td>
                                <td>A2</td>
                                <td>상품 입고는 언제되나요?</td>
                                <td>미처리</td>
                            </tr>
                            <tr class="table_title">
                                <td><input type="checkbox" name="typArr"></td>
                                <td>5</td>
                                <td>2024/02/25</td>
                                <td>user01</td>
                                <td>고추장</td>
                                <td>A2</td>
                                <td>실온보관 가능한가요?</td>
                                <td>미처리</td>
                            </tr>
                            <tr class="table_title">
                                <td><input type="checkbox" name="typArr"></td>
                                <td>4</td>
                                <td>2024/02/25</td>
                                <td>user03</td>
                                <td>고추장</td>
                                <td>A2</td>
                                <td>많이 팔아주세요</td>
                                <td>처리</td>
                            </tr>
                            <tr class="table_title">
                                <td><input type="checkbox" name="typArr"></td>
                                <td>3</td>
                                <td>2024/02/25</td>
                                <td>user02</td>
                                <td>고추장</td>
                                <td>A2</td>
                                <td>상품 유통기한은 언제까지인가요 </td>
                                <td>처리</td>
                            </tr>
                            <tr class="table_title">
                                <td><input type="checkbox" name="typArr"></td>
                                <td>2</td>
                                <td>2024/02/25</td>
                                <td>user02</td>
                                <td>고추장</td>
                                <td>A2</td>
                                <td>많이 매운가요</td>
                                <td>처리</td>
                            </tr>
                            <tr class="table_title">
                                <td><input type="checkbox" name="typArr"></td>
                                <td>1</td>
                                <td>2024/02/25</td>
                                <td>user02</td>
                                <td>고추장</td>
                                <td>A2</td>
                                <td>많이 짠가요</td>
                                <td>처리</td>
                            </tr>
                        </tbody>
                    </table>     
                </div>
                    <div style="font-weight: bold;">
                        총 문의 수 : <label style="color: red;">6</label>
                    </div>                  
            </div>
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
              </ul>
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

            
        </section>
        <!-- Section end -->

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

		<%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>