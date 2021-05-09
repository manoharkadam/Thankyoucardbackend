package com.hssa.hr.configuration;

import java.io.File;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.core.annotation.Order;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
import org.springframework.ws.transport.http.MessageDispatcherServlet;

@Order(1)
public class PriceGliderInitializer extends AbstractAnnotationConfigDispatcherServletInitializer  {
	
	private int maxUploadSizeInMb = 5 * 1024 * 1024; // 5 MB
	
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		//ctx.register(AppConfig.class);
		ctx.setServletContext(servletContext);
		MessageDispatcherServlet servlet = new MessageDispatcherServlet();
		servlet.setApplicationContext(ctx);
		servlet.setTransformWsdlLocations(true);
		Dynamic dynamic = servletContext.addServlet("dispatcher1", servlet);
		//dynamic.addMapping("/soapws/*");
		
		super.onStartup(servletContext);
		/*
		 * Needed to support a "request" scope in Spring Security filters,
		 * since they're configured as a Servlet Filter. But not necessary
		 * if they're configured as interceptors in Spring MVC.
		 */
		servletContext.addListener(new RequestContextListener());
	}

	@Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] { PriceGliderConfiguration.class, OAuth2ClientSecurityConfig.class};
    }
  
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return null;
    }
  
    @Override
    protected String[] getServletMappings() {
        return new String[] { "/" };
    }

    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {

        // upload temp file will put here
        File uploadDirectory = new File(System.getProperty("java.io.tmpdir"));

        // register a MultipartConfigElement
        MultipartConfigElement multipartConfigElement =
                new MultipartConfigElement(uploadDirectory.getAbsolutePath(),
                        maxUploadSizeInMb, maxUploadSizeInMb * 2, maxUploadSizeInMb / 2);

        registration.setMultipartConfig(multipartConfigElement);
    }
}
