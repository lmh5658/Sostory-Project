<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.pay.model.vo.Pay, java.util.List"%>
    
    
<%
 	List<Pay> list = (List<Pay>)request.getAttribute("list");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	/*결제페이지 스타일*/
         .content{box-sizing: border-box;}
         .content{width: 80%; min-height: 1300px; margin: auto;}
        table{width: 100%; border: 1;}
        table tr{ height: 50px;}
        .pay_img{text-align: center;}
        .pay_img th{width: 50px; height: 100px; border: 1px solid black;}
        .order_pro{text-align: center; border: 1;}
        .order_pro th{width: 100px;}
        .ch_box{width: 15px; height: 15px;}

</style>

</head>
<body>
	 <div class="wrap container p-3">

        <%@ include file="/views/common/header.jsp" %>

<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
        
        <!-- Section start -->
        <section class="content">
        <!-- 결제 페이지 시작-->
        <div class="section_main">

            <br><br><br><br><br><br><br><br>
            <h2><b>주문결제</b></h2>
            <div>
                <form action="" method="">
                    <table>
                        <tr>
                            <br><br>
                            <th colspan="3" style="border-bottom: 1px solid rgb(158, 158, 158);"><h5><b>주문자정보</b></h5></th>
                        </tr>
                        <tr>
                            <th colspan="2"><input type="checkbox" class="ch_box">&nbsp;&nbsp;주문자 정보 동일</th>
                            <th style="text-align: right;"><label style="color: red;">*&nbsp;&nbsp;</label><b>필수입력사항</b>&nbsp;&nbsp;</th>
                        </tr>
                        <tr>
                            <th><label style="color: red;">*&nbsp;&nbsp;</label>받는분</th>
                            <td><input type="text" class="form-control" placeholder="이름을 입력하세요"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th><label style="color: red;">*&nbsp;&nbsp;</label>휴대폰번호</th>
                            <td><input type="tel" class="form-control" placeholder="휴대폰번호를 입력하세요 (숫자만)"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th><label style="color: red;">*&nbsp;&nbsp;</label>이메일</th>
                            <td><input type="email" class="form-control" placeholder="이메일을 입력하세요"></td>
                            <td></td>
                        </tr>
                    </table>
            </div>
            <div style="border-top: 3px solid grey; display: flex; justify-content: center;">
                <table>
                    <tr style="border-bottom: 1px solid gray;">
                        <th colspan="4" style="border-bottom: 1px solid rgb(158, 158, 158);"><h5><b>배송정보</b></h5></th>
                    </tr>
                    <tr>                      
                        <th><input type="checkbox" class="ch_box">&nbsp;&nbsp;기본 배송지</th>
                        <th colspan="2">
                            <select name="" id="" class="form-control">
                                <option value="">배송지를 선택하세요</option>
                                <option value="">마이페이지에있는 주소 끌어오기</option>
                            </select>
                        </th>
                    </tr>
                    <tr>
                        <th><label style="color: red;">*&nbsp;&nbsp;</label>주소</th>
                        <th><input type="text" class="form-control" placeholder="우편번호"></th>
                        <th></th>
                        <th><input type="text" class="form-control" placeholder="기본주소"></th>
                        <th><button type="button" class="btn btn-secondary">우편번호 찾기</button></th>
                    </tr>
                    <tr>
                        <th></th>
                        <th colspan="3"><input type="text" class="form-control" placeholder="상세주소를 입력하세요"></th>
                        <th></th>
                    </tr>
                    <tr>
                        <th><label style="color: red;">*&nbsp;&nbsp;</label>배송시 입력사항</th>
                        <th colspan="3">
                            <input list="post_i" class="form-control">
                            <datalist name="" id="post_i">
                                <option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
                                <option value="택배함에 놔주세요">택배함에 놔주세요</option>
                                <option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
                            </datalist>
                        </th>
                        <th></th>
                    </tr>
                </table>
            </div>
            <div style="border-top: 3px solid grey; display: flex; justify-content: center;">
                <table class="order_pro">
                    <tr>
                        <th colspan="4" style="border-bottom: 1px solid rgb(158, 158, 158); text-align: left; height: 40px;">
                            <h5><b>주문상품</b></h5>
                        </th>
                    </tr>
                     <% for(Pay p : list) { %>
                    <tr>
                        <th style="width: 50px;">
                            <img src="<%=contextPath + "/" + p.getPath() %>" alt="" width="130px" height="130px">
                        </th>
                        <th><%=p.getProductName() %></th>
                        <th><%=p.getPrice() %></th>
                        <th><%=p.getCount() %></th>
                    </tr>
                    <%} %>
                 
                </table>
            </div>
        </div>
        <div style="border-top: 3px solid grey; display: flex; flex-direction: column; justify-content: right;">
            <div style="display: flex; justify-content: left; width: 100%; border-bottom: 1px solid gray; height: 40px;">
                <h5><b>결제금액</b></h5>
            </div>
            <table class="table" style="width: 100%; text-align: right;">
                <tr>
                    <th></th><th></th>
                    <th>상품금액</th>
                    <th>31,000원</th>
                </tr>
                <tr>
                    <th></th><th></th>
                    <th>배송비</th>
                    <th>0원</th>
                </tr>
                <tr>
                    <th></th><th></th>
                    <th>할인금액</th>
                    <th>4,000원</th>
                </tr>
                <tr>
                    <th></th><th></th>
                    <th>총 결제 금액</th>
                    <th>29,000원</th>
                </tr>
            </table>
        </div>
        <div style="border-top: 3px solid grey; display: flex; display: flex; flex-direction: column; align-items: center;">
            <div style="display: flex; justify-content: left; width: 100%; border-bottom: 1px solid gray; height: 40px;">
                <h5><b>결제방법</b></h5>
            </div>
            <div>
                    <table class="table" border="1">
                        <tr>
                            <th colspan="2" style="text-align: center;"><h5><b>무통장입금</b></h5></th>
                        </tr>
                        <tr>
                            <th>예금주명</th>
                            <td><input type=""  class="form-control" placeholder="이름을 입력하세요"></td>
                        </tr>
                        <tr>
                            <th>은행명</th>
                            <td><input type=""  class="form-control" placeholder="예)농협"></td>
                        </tr>
                        <tr>
                            <th>계좌번호</th>
                            <td><input type=""  class="form-control" placeholder="숫자만 입력하세요"></td>
                        </tr>
                        <tr>
                            <th colspan="2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16" style="color: red;">
                                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4m.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2"/>
                                  </svg>
                                <b>!주의사항! 예금주명 / 은행명 / 계좌번호를 정확히 입력하세요</b>
                            </th>
                        </tr>
                        <tr style="text-align: center;">
                            <th colspan="2">입금은행명 : 농협 <br>
                                입금은행계좌명 : 234234-234234-234
                            </th>
                        </tr>
                    </table>
                   
            </div>
            <div style="border-bottom: 2px; border-top: 3px solid grey; display: flex; display: flex; flex-direction: column; align-items: center; width: 100%;">
                <table>
                    <tr>
                        <th colspan="2"><input type="checkbox" class="ch_box" id="checking" required><b>&nbsp;&nbsp;주문내용 확인 및 결제 동의</b></th>
                    </tr>
                    <tr>
                        <th>
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
                                <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0"/>
                            </svg>(필수) 개인정보 수집 이용 동의
                        </th>
                        <th><u>보기</u></th>
                    </tr>
                    <tr>
                        <th>
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
                                <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0"/>
                            </svg>(필수) 개인정보 제3자 정보 제공 동의
                        </th>
                        <th><u>보기</u></th>
                    </tr>
                    <tr>
                        <th>
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
                                <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0"/>
                            </svg>(필수) 결제대행 서비스 이용약관 동의
                        </th>
                        <th><u>보기</u></th>
                    </tr>
                </table>
            </div>
                <div style="margin: 50px;">
                    <button type="button" class="btn btn-danger disabled" id="btn_success">결제하기</button>
                </div>
            </form> 
            <script>
                $(function(){
                    $("#checking").click(function(){

                        if(this.checked){
                            $("#btn_success").removeClass("disabled");
                        }else{
                            $("#btn_success").addClass("disabled");
                        }
                })
                    
                    
                })
            </script>

            
        </div>
        <!-- 결제 페이지 끝-->

            
        </section>
        <!-- Section end -->
       </div>

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

       <%@ include file="/views/common/footer.jsp" %>






</body>
</html>