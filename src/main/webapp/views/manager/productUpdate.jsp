<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*상품관리>상품수정 스타일*/
     .section_title{display: flex; margin: 30px;}
     .section_title label{font-weight: bold; font-size: 20px;}
     .btn{display: flex; justify-content: center; align-items: center; border: none;}
     .btn>button{
        width: 100px;
        background-color: #c20000; /* 배경색 설정 */
        color: #ffffff; /* 텍스트 색상 설정 */
        border: none; /* 테두리 제거 */
        font-weight: bold;
        font-size: 17px;
        border-radius: 6px;
        height: 40px;
        margin-top: 15px;
        
     }
     form{margin: 80px; margin-left: 150px;}
     th{width: 200px;}
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
                </svg>상품관리><b>상품수정</b>
            </div>

            <div>
                <form action="">
                    <table class="table">
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <select name="" id="" class="form-control" style="width: 200px;">
                                    <option value="">1차카테고리</option>
                                    <option value="">장류</option>
                                    <option value="">드레싱</option>
                                </select>
                                <br>
                                <select name="" id="" class="form-control" style="width: 200px;">
                                    <option value="">2차카테고리</option>
                                    <option value="">고추장</option>
                                    <option value="">쌈장</option>
                                </select>
                                <br>
                            </td>
                        </tr>
                        <tr>
                            <th>상품명</th>
                            <td><input type="text" class="form-control" placeholder="상품명을 입력하세요"></td>
                        </tr>
                        <tr>
                            <th>상품코드</th>
                            <td><input type="text" class="form-control" placeholder="상품 등록 시 자동부여"></td>
                        </tr>
                        <tr>
                            <th>썸네일 이미지</th>
                            <td><input type="file" class="form-control"></td>
                        </tr>
                        <tr>
                            <th>상품상세 이미지</th>
                            <td><input type="file" class="form-control"></td>
                        </tr>
                        <tr>
                            <th>판매가</th>
                            <td><input type="number" class="form-control" style="width: 200px;"></td>
                        </tr>
                        <tr>
                            <th>할인가</th>
                            <td><input type="number" class="form-control" style="width: 200px;"></td>
                        </tr>
                        <tr>
                            <th>업체명</th>
                            <td><input type="text" class="form-control"></td>
                        </tr>
                        <tr>
                            <th>수량</th>
                            <td><input type="number" name="amount" min="0" max="1000" step="1" value="0" class="form-control" style="width: 80px;"></td>
                        </tr>               
                    </table>
                    <div class="btn">
                        <button onclick="return confirm('상품을 등록하시겠습니까?')">상품등록</button>
                    </div>
                </form>
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
                        if($(this).text() == "품절"){
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