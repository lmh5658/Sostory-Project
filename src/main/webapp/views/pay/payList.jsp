<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sos.pay.model.vo.Pay, java.util.List, com.sos.myPage.model.vo.Address"%>
<%@ page import="com.google.gson.Gson" %>
    
    
<%
 	List<Pay> list = (List<Pay>)request.getAttribute("list");
	int totalPrice = (int)request.getAttribute("totalPrice");
	List<Address> addressList = (List<Address>)request.getAttribute("addressList");
	Gson gson = new Gson();
	String addressListJson = gson.toJson(addressList);
	int dcPrice = (int)request.getAttribute("discountPrice");
	int addressPrice = 3000;
	int dcPriceZero =0;
	List<Pay> productInfolist = (List<Pay>)request.getAttribute("productInfolist");
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문결제페이지</title>

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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
                <form action="<%=contextPath %>/payComplete.pa" method="post">
                    <table>
                        <tr>
                            <br><br>
                            <th colspan="3" style="border-bottom: 1px solid rgb(158, 158, 158);"><h5><b>주문자정보</b></h5></th>
                        </tr>
                        <tr>
                            <th colspan="2"><input type="checkbox" class="ch_box" onclick="orderInfo()" id="orderInfoCheckbox">&nbsp;&nbsp;주문자 정보 동일</th>
                            <th style="text-align: right;"><label style="color: red;">*&nbsp;&nbsp;</label><b>필수입력사항</b>&nbsp;&nbsp;</th>
                        </tr>
                        <tr>
                            <th><label style="color: red;">*&nbsp;&nbsp;</label>받는분</th>
                            <td><input type="text" class="form-control" placeholder="이름을 입력하세요" id="orderName" name="orderName" required></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th><label style="color: red;">*&nbsp;&nbsp;</label>휴대폰번호</th>
                            <td><input type="tel" class="form-control" placeholder="휴대폰번호를 입력하세요 (숫자만)" id="orderPhone" name="orderPhone" required></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th><label style="color: red;">*&nbsp;&nbsp;</label>이메일</th>
                            <td><input type="email" class="form-control" placeholder="이메일을 입력하세요" id="orderEmail" name="orderEmail" required></td>
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
                        <th><input type="checkbox" class="ch_box" onclick="addressInfo()" id="addressInfoCheckbox">&nbsp;&nbsp;기본 배송지</th>
                        <th colspan="2">
                            <select name="addList" class="form-control" id="addList">
                                <option value="0">배송지를 선택하세요</option>
                                  <% int index = 1; %>
                                  <%if(addressList != null) {%>
									<% for(Address a : addressList) { %>
										 <option value="<%= index++ %>"><%= a.getAddressLocal() %></option>
									<% } %>
								<%} %>
                            </select>
                        </th>
                    </tr>
                    <tr>
                        <th><label style="color: red;">*&nbsp;&nbsp;</label>주소</th>
                        <th colspan="3"><input type="text" class="form-control" placeholder="기본주소" id="addressName" name="addressName"></th>
                        
                        <th><button type="button" class="btn btn-secondary" onclick="findAddress()">주소 찾기</button></th>
                    </tr>
                    <tr>
                        <th></th>
                        <th colspan="3"><input type="text" class="form-control" placeholder="상세주소를 입력하세요" id="addressDetail" name="addressDetail"></th>
                        <th></th>
                    </tr>
                    <tr>
                        <th><label style="color: red;">&nbsp;&nbsp;</label>배송시 요청사항</th>
                        <th colspan="3">
                            <input type="text" class="form-control" placeholder="요청사항을 입력해주세요" id="requestContent" name="requestContent">
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
                     <% for(Pay p : productInfolist) { %>
                    <tr>
                        <th style="width: 50px;">
                            <img src="<%=contextPath + "/" + p.getPath() %>" alt="" width="130px" height="130px">
                        </th>
                         <th> <%=p.getProductName() %> </th>
                        <th>
                        	<%if(p.getDiscountPrice().equals("0")){ %>
                        		<%=p.getPrice() %>
                        	<%}else{ %>
						
						        <%=p.getPriceMinusDcprice() %>
						        <h7 style="color:gray;"><b><s><%=p.getPrice() %></s></b></h7>
						
						    <%} %>
						</th>
                        <th><%=p.getCount() %></th>
                    </tr>
                        <input type="hidden" name="productCount" value="<%=p.getCount() %>">
                        <input type="hidden" name="productNo" value="<%=p.getProductNo() %>">
                        <input type="hidden" name="productName" value="<%=p.getProductName() %>">
                        <input type="hidden" name="productPrice" value="<%=p.getPrice() %>">
                        <input type="hidden" name="productPath" value="<%=p.getPath() %>">
                        <input type="hidden" name="productDiscountPrice" value="<%=p.getDiscountPrice() %>">
                        <input type="hidden" name="productMinusPrice" value="<%=p.getPriceMinusDcprice() %>">
                    <%} %>
                 
                </table>
            </div>
           <br><br><br> 
           
        </div>
        <div style="border-top: 3px solid grey; display: flex; flex-direction: column; justify-content: right;">
            <div style="display: flex; justify-content: left; width: 100%; border-bottom: 1px solid gray; height: 40px;">
                <h5><b>결제금액</b></h5>
            </div>
            <table class="table" style="width: 100%; text-align: right;">
                <tr>
                    <th></th><th></th>
                    <th>상품금액</th>
                    <th><%=totalPrice+dcPrice %>원</th>
                </tr>
                <tr>
                    <th></th><th></th>
                    <th>배송비</th>
                    <th><%=addressPrice %>원</th>
                </tr>
                <tr>
                    <th></th><th></th>
                    <th>할인금액</th>
                    <%if(dcPrice > 0){ %>
                    <th><%=dcPrice %>원</th>
                    <%}else{ %>
                    <th><%=dcPriceZero %>원</th>
                    <%} %>
                </tr>
                <tr>
                    <th></th><th></th>
                    <th style="font-size: 20px;">총 결제 금액</th>
                    <th style="font-size: 20px;"><%=totalPrice+addressPrice %>원</th>
                
                     <input type="hidden" name="payPrice" value="<%=totalPrice+addressPrice %>">
                    
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
                            <td><input type="text"  class="form-control" placeholder="이름을 입력하세요" name="accountHolder"></td>
                        </tr>
                        <tr>
                            <th>은행명</th>
                            <td><input type="text"  class="form-control" placeholder="예)농협" name="bankName"></td>
                        </tr>
                        <tr>
                            <th>계좌번호</th>
                            <td><input type="text"  class="form-control" placeholder="숫자만 입력하세요" name="accountNumber"></td>
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
                    <button type="submit" class="btn btn-danger disabled" id="btn_success">결제하기</button>
                </div>
            </form> 
            
            
        </div>
        <!-- 결제 페이지 끝-->

            
        </section>
        <!-- Section end -->
       </div>
       
       <script>
       
       
      		 	// 주문내용 확인 및 결제 동의 체크시 결제하기 버튼 활성화 
                $(function(){
                	
                    $("#checking").click(function(){

                        if(this.checked){
                            $("#btn_success").removeClass("disabled");
                        }else{
                            $("#btn_success").addClass("disabled");
                        }
                })
                    
                    
                })
                
                
                 // select 마이페이지에 등록된 배송지 클릭 시 해당 배송지주소, 상세주소 뿌려주는 스크립트 
                var addressList = <%= addressListJson %>;
    
			    $(document).ready(function() {
			        $("#addList").change(function() {
			            var selectedAddressIndex = $(this).val(); // 선택한 option의 값 가져오기
			            var selectedAddress = addressList[selectedAddressIndex - 1]; // 선택한 option에 해당하는 주소 정보 가져오기 (인덱스는 0부터 시작하므로 -1 필요)
			            if (selectedAddress) {
			                $("#addressName").val(selectedAddress.addressAddress); // 주소 정보를 input의 value로 설정
			                $("#addressDetail").val(selectedAddress.addressDetail); // 주소 정보를 input의 value로 설정
			            }
			        });
			    });
                
                
                // 주문자정보 동일 체크박스 클릭시 실행될 함수
                function orderInfo(){
                	
                	<%
            		int userNo = loginUser.getUserNo();
                		
            		%>
            		
            		var userNo = <%= userNo %>;
            		var isChecked = $("#orderInfoCheckbox").prop("checked");
            		
            		if (isChecked) {
                	$.ajax({
                  		
                  		url:"<%=contextPath%>/loginInfo.pa",
						data:{
							
							userNo:userNo,
						},
							type:"post",
							success:function(m){
								$("#orderName").val(m.userName);
								$("#orderPhone").val(m.phone);
								$("#orderEmail").val(m.email);
								console.log("조회성공!");
								},
							error:function(){
								console.log("ajax 통신 실패");
								
							}
                  		
                  		})
            		}else{
            			 // 체크 해제되었을 때 초기화
            	        $("#orderName").val("");
            	        $("#orderPhone").val("");
            	        $("#orderEmail").val("");
            		}
                }
                
                // 기본 배송지 체크박스 클릭시 실행될 함수
                function addressInfo(){
                	
                	<%
            		int userNo1 = loginUser.getUserNo();
                		
            		%>
            		
            		var userNo = <%= userNo1 %>;
            		var isChecked = $("#addressInfoCheckbox").prop("checked");
            		var selectElement = $("#addList"); 
            		
            		if (isChecked) {
                	$.ajax({
                  		
                  		url:"<%=contextPath%>/addressBasicInfo.pa",
						data:{
							
							userNo:userNo,
						},
							type:"post",
							success:function(a){
								$("#addressName").val(a.addressAddress);
								$("#addressDetail").val(a.addressDetail);
								console.log("조회성공!");
								},
							error:function(){
								console.log("ajax 통신 실패");
								
							}
                  		
                  		})
                  		
                  		 
				     	// 체크박스가 선택되면 select 태그를 비활성화.
                        selectElement.prop('disabled', true); 
                	 	selectElement.val("0"); // 첫 번째 옵션 선택
                	
            		}else{
            			 // 체크 해제되었을 때 초기화
            	        $("#addressName").val("");
            	        $("#addressDetail").val("");
            	        
            	        
            	    	 // 체크 해제되었을 때 select 태그를 활성화.
            	    	
				        
            	        selectElement.prop('disabled', false); 
            	        selectElement.val("0"); // 첫 번째 옵션 선택

            		}
                	
                }
                
                
                // 우편번호찾기 API관련 스크립트
                function findAddress() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                
			                	addr = data.jibunAddress;
			                	
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    // 조합된 참고항목을 해당 필드에 넣는다.
			                
			                } 
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다. 
			                // 주소를 넣어줄 input id값설정. ==> 밑에 코드경우 addressName
			                document.getElementById("addressName").value = addr;
			                // 커서를 상세주소 필드로 이동한다. 상세주소는 입력받아야함
			                // 상세주소 input id값설정. ==> 밑에 코드경우 addressDetail
			                document.getElementById("addressDetail").focus();
			            }
			        }).open();
    			}
                  
            </script>

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

       <%@ include file="/views/common/footer.jsp" %>






</body>
</html>