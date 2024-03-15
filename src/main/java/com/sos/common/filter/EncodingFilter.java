package com.sos.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class EncodingFilter
 * 
 * 어떤 서블릿이 실행되기 전에 매번 공통적으로 실행해야되는 구문이 있을 경우
 * 필터로 한번 정의해두고 해당 필터를 거쳐가게끔 등록해둘 수 있음
 * => 매 서블릿마다 매번 중복된 코드를 작성할 필요 없음
 * 
 * 필터의 라이프사이클
 * 1) 자동으로 init() 메소드가 호출되면서 해당 Filter 객체 생성
 * 2) doFilter(request, response, chain) 메소드가 호출됨
 * 		: 즉, 서블릿 실행되기 전에 실행시키고자 하는 코드를 doFilter 메소드 안에 작성
 * 3) detroy() 메소드 실행되면서 해당 Filter 객체 소멸됨
 * 
 *  필터 등록하는 방법 (필터등록해야 정상적으로 작동) ==> 2가지 방법중 하나만
 *  어떤 url로 요청시 해당 필터가 수행되게할건지
 *  
 *  1) web.xml에 등록하는 방법
 *  2) WebFilter 어노테이션을 이용하는 방법
  */
@WebFilter(filterName="encodingFilter", urlPatterns="/*")
public class EncodingFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public EncodingFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		
		// servlet 실행전에 실행시킬 코드
		
//		System.out.println("==== 서블릿 실행전에 실행됨 ====");
		
		if(((HttpServletRequest)request).getMethod().equalsIgnoreCase("post")) {
			
			request.setCharacterEncoding("UTF-8");
		}
		
		
		chain.doFilter(request, response); // 서블릿 본격적으로 호출하는 구문
		// 여러 필터가 있어서 다음필터를 호출해야될 경우 => 해당 필터를 호출 구문
		// 현재 필터가 마지막 필터일 경우 => 최종적으로 수행시킬 서블릿 호출 구문
		
		// servlet 다 실행한 후에 실행시킬 코드
		//  ~~~~~
//		System.out.println("==== 서블릿 실행후에 실행됨 ====");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
