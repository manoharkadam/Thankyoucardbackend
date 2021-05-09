package com.hssa.hr.configuration;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.web.util.ContentCachingRequestWrapper;
import org.springframework.web.util.ContentCachingResponseWrapper;
import org.springframework.web.util.WebUtils;

/**
 * Servlet Filter implementation class RequestResponseFilter
 */
@WebFilter(filterName = "requestResponseFilter", urlPatterns = "/rest/*")
public class RequestResponseFilter implements Filter {
	
	public void init(FilterConfig filterConfig) throws ServletException {
	}
	
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {

		if (servletRequest instanceof HttpServletRequest
	            && servletResponse instanceof HttpServletResponse) {
	            HttpServletRequest request = (HttpServletRequest) servletRequest;
	            HttpServletResponse response = (HttpServletResponse) servletResponse;
	 
	            HttpServletRequest requestToCache = new ContentCachingRequestWrapper(request);
	            HttpServletResponse responseToCache = new ContentCachingResponseWrapper(response);
	            filterChain.doFilter(requestToCache, response);
	            System.out.println("URL : " + requestToCache.getRequestURI() +" (" +  requestToCache.getMethod() + ")");
	            String requestData = getRequestData(requestToCache);
	            System.out.println("Request :" +requestData);
	          
	            String responseData = getResponseData(responseToCache);
	            if(null != responseData)
	            	responseData = responseData.length() > 512 ? responseData.substring(0, 500) + " .... " : responseData;
	    	    System.out.println("Response :" + responseData);
	    	    
		} else {
	        	filterChain.doFilter(servletRequest, servletResponse);
	        }
	    }
	 
	    private static String getRequestData(final HttpServletRequest request) throws UnsupportedEncodingException {
	        String payload = null;
	        ContentCachingRequestWrapper wrapper = WebUtils.getNativeRequest(request, ContentCachingRequestWrapper.class);
	        if (wrapper != null) {
	            byte[] buf = wrapper.getContentAsByteArray();
	            if (buf.length > 0) {
	                payload = new String(buf, 0, buf.length, wrapper.getCharacterEncoding());
	            }
	        }
	        return payload;
	    }
	 
	    private static String getResponseData(final HttpServletResponse response) throws IOException {
	        String payload = null;
	        ContentCachingResponseWrapper wrapper =
	            WebUtils.getNativeResponse(response, ContentCachingResponseWrapper.class);
	        if (wrapper != null) {
	            byte[] buf = wrapper.getContentAsByteArray();
	            if (buf.length > 0) {
	                payload = new String(buf, 0, buf.length, wrapper.getCharacterEncoding());
	                wrapper.copyBodyToResponse();
	            }
	        }
	        return payload;
	    } 
	

	public void destroy() {
	}

}