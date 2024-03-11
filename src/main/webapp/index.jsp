<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>* JSP(Java Server Page)</h1>
	
	<p>
		JSP란, HTML내에서 자바코드를 쓸 수 있는 "자바 언어" <br>
		Servlet(자바코드내)에서 응답화면을 구현했던 복잡함을 보다 간단하게 해결 가능 <br>
		=> 즉, JSP의 가장 큰 장점은 Servlet에서는 오로지 요청처리(비즈니스 로직)에만 집중하고 <br>
		   응답화면만들기(프레젠테이션 로직)는 JSP에서 집중하게끔 역할을 분리할 수 있는 것
		
	</p>
	
	<hr>
	
	<h2>* JSP Element 표현법</h2>
	<h3>1. JSP 스크립팅 원소(Scripting Element)</h3>
	<p>JSP페이지 내에서 자바코드를 기술 할 수 있게 해주는 기능</p>
	<ol>
		<li>
			선언문 : &lt;%! 자바코드 %&gt; <br>
			멤버변수와 메소드를 선언할 때 사용
		</li>
		<li>
			스크립틀릿 : &lt;% 자바코드 %&gt; <br>
			실행시킬 일반적인 자바코드 (제어문, 변수선언문, 등등)
		</li>
		<li>
			표현식(출력식) : &lt;%= 자바코드 %&gt; <br>
			자바에서의 값(변수 또는 메소드 실행)을 화면상에 출력하기 위해 사용
		</li>
	</ol>
	<a href="http://localhost:8888/jsp/views/01_ScriptingElement.jsp" target="_blank">Scripting Element 테스트</a>
	
	<h3>
		2. 지시어(Directive) <br> 
		&lt;%@ page|include|taglib 속성="속성값" 속성="속성값" .. %&gt;
	</h3>
	<p>JSP 페이지 전체에 영향을 미치는 정보를 기술 할 때 쓰임</p>
	
	<ol>
		<li>
			page 지시어 : 현재 jsp 페이지를 처리하는데 필요한 속성들을 기술하는 영역 <br>
			<a href="views/02_pageDirective.jsp" target="_blank">Page Directive 테스트</a>
		</li>
		<li>
			include 지시어 : 현재 jsp에서 또다른 jsp를 포함시킬때 사용하는 지시어 <br>
			<a href="views/03_includeDirective.jsp" target="_blank">Include Directive 테스트</a>
		</li>
		<li>
			taglib 지시어 : JSP 기능을 좀 더 확장시킬 수 있는 추가적인 라이브러리를 등록하는 구문(세미 후) <br>
			<a>Taglib Directive 테스트</a>
		</li>
	</ol>
	
	<h3>
		3. 액션 태그(세미 후)
		xml 기술을 이용해서 기존의 jsp문법을 확장하는 기술을 제공하는 태그
	</h3>
	
	<hr>
	
	<h2>피자주문페이지(.jsp) --주문요청(request)--> 주문요청을 받아서 처리해주는 Servlet 구동 --> 피자결제페이지(응답jsp)</h2>
	
	<a href="views/pizzaOrderForm.jsp" target="_blank">피자주문하기 페이지로 가기</a>
	
	
</body>
</html>