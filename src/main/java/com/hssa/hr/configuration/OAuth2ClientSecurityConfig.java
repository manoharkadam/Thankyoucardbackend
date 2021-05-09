package com.hssa.hr.configuration;

import java.io.IOException;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Description;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestOperations;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.filter.OAuth2ClientAuthenticationProcessingFilter;
import org.springframework.security.oauth2.client.filter.OAuth2ClientContextFilter;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.client.token.grant.code.AuthorizationCodeResourceDetails;
import org.springframework.security.oauth2.common.AuthenticationScheme;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;
import org.springframework.security.oauth2.provider.error.OAuth2AuthenticationEntryPoint;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.access.ExceptionTranslationFilter;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

import com.hssa.hr.oauth2.google.GoogleUserInfoTokenServices;

@Configuration
@EnableWebSecurity
@EnableOAuth2Client
@PropertySource("classpath:google-oauth2.properties")
public class OAuth2ClientSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private OAuth2ClientContext oauth2ClientContext;

	@Autowired
	private OAuth2ClientContextFilter oauth2ClientContextFilter;

	@Value("${oauth2.clientId}")
	private String clientId;

	@Value("${oauth2.clientSecret}")
	private String clientSecret;

	@Value("${oauth2.userAuthorizationUri}")
	private String userAuthorizationUri;

	@Value("${oauth2.accessTokenUri}")
	private String accessTokenUri;

	@Value("${oauth2.tokenName:authorization_code}")
	private String tokenName;

	@Value("${oauth2.scope}")
	private String scope;

	@Value("${oauth2.userInfoUri}")
	private String userInfoUri;
	
	@Value("${oauth2.redirectUrl}")
	private String redirectUri;

	@Value("${oauth2.filterCallbackPath}")
	private String oauth2FilterCallbackPath;

	private OAuth2ProtectedResourceDetails authorizationCodeResource() {
		AuthorizationCodeResourceDetails details = new AuthorizationCodeResourceDetails();
		details.setId("google-oauth-client");
		details.setClientId(clientId);
		details.setClientSecret(clientSecret);
		details.setUserAuthorizationUri(userAuthorizationUri);
		details.setAccessTokenUri(accessTokenUri);
		details.setTokenName(tokenName);
		String commaSeparatedScopes = scope;
		details.setScope(parseScopes(commaSeparatedScopes));
	/*	details.setPreEstablishedRedirectUri(redirectUri);
		details.setUseCurrentUri(false);*/
		/*
		 * If a pre-established redirect URI is used, it will need to be an
		 * absolute URI. To do so, it'll need to compute the URI from a
		 * request. The HTTP request object is available when you override
		 * OAuth2ClientAuthenticationProcessingFilter#attemptAuthentication().
		 *
		 * details.setPreEstablishedRedirectUri(
		 * 		env.getProperty("oauth2.redirectUrl"));
		 * details.setUseCurrentUri(false);
		 */
		
		details.setAuthenticationScheme(AuthenticationScheme.query);
		System.out.println("Google API OAuth2ProtectedResourceDetails - AuthenticationScheme.query"+AuthenticationScheme.query);
		details.setClientAuthenticationScheme(AuthenticationScheme.form);
		System.out.println("Google API OAuth2ProtectedResourceDetails AuthenticationScheme.form"+AuthenticationScheme.form);
		return details;
	}

	private List<String> parseScopes(String commaSeparatedScopes) {
		List<String> scopes = new LinkedList<>();
		Collections.addAll(scopes, commaSeparatedScopes.split(","));
		return scopes;
	}

	/**
	 * @return an OAuth2 client authentication processing filter
	 */
	@Bean
	@Description("Filter that checks for authorization code, "
			+ "and if there's none, acquires it from authorization server")
	public OAuth2ClientAuthenticationProcessingFilter
				oauth2ClientAuthenticationProcessingFilter() {
		// Used to obtain access token from authorization server (AS)
		OAuth2RestOperations restTemplate = new OAuth2RestTemplate(
				authorizationCodeResource(),
				oauth2ClientContext);
		OAuth2ClientAuthenticationProcessingFilter filter =
				new OAuth2ClientAuthenticationProcessingFilter(oauth2FilterCallbackPath);
		System.out.println("Google API restTemplate"+restTemplate);
		filter.setRestTemplate(restTemplate);
		filter.setTokenServices(googleUserInfoTokenServices());
		return filter;
	}

	@Bean
	@Description("Google API UserInfo resource server")
	public GoogleUserInfoTokenServices googleUserInfoTokenServices() {
		GoogleUserInfoTokenServices userInfoTokenServices =
				new GoogleUserInfoTokenServices(userInfoUri, clientId);
		// TODO Configure bean to use local database to read authorities
		// userInfoTokenServices.setAuthoritiesExtractor(authoritiesExtractor);
		System.out.println("Google API UserInfo resource server- userInfoUri"+userInfoUri);
		System.out.println("Google API UserInfo resource server- clientId"+clientId);
		System.out.println("userInfoTokenServices---LOgin"+userInfoTokenServices);
		return userInfoTokenServices;
	}

	@Bean
	public AuthenticationEntryPoint authenticationEntryPoint() {
		// May need an OAuth2AuthenticationEntryPoint for non-browser clients
		//return new OAuth2AuthenticationEntryPoint();
		System.out.println("oauth2FilterCallbackPath--"+oauth2FilterCallbackPath);
		return new LoginUrlAuthenticationEntryPoint(oauth2FilterCallbackPath);
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers(
				 "/resources/**", "/webjars/**", "/rest/**","/hello", "/soapws/**","/soap/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.csrf().disable().
		exceptionHandling().accessDeniedHandler(new AccessDeniedHandler() {
			
			@Override
			public void handle(HttpServletRequest request, HttpServletResponse response,
					AccessDeniedException accessDeniedException) throws IOException, ServletException {
				response.sendRedirect("/Priceglider/logout");
			}
		})
					.authenticationEntryPoint(authenticationEntryPoint())
			.and()
				.authorizeRequests()
					.anyRequest().authenticated()
			.and()
				.logout()
					.logoutUrl("/hello")
					.logoutSuccessUrl("/logout")
			.and()
				.addFilterAfter(
					oauth2ClientContextFilter,
					ExceptionTranslationFilter.class)
				.addFilterBefore(
					oauth2ClientAuthenticationProcessingFilter(),
					FilterSecurityInterceptor.class)
				.anonymous()
					.disable();
	}

	@Override
	protected AuthenticationManager authenticationManager() throws Exception {
		return new NoopAuthenticationManager();
	}

	private static class NoopAuthenticationManager implements AuthenticationManager {
		@Override
		public Authentication authenticate(Authentication authentication)
				throws AuthenticationException {
			throw new UnsupportedOperationException(
					"No authentication should be done with this AuthenticationManager");
		}
	}
	
	@Bean
	@Description("Enables ${...} expressions in the @Value annotations"
			+ " on fields of this configuration. Not needed if one is"
			+ " already available.")
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

}
