<%@ page session="false"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"
%><!DOCTYPE html>
<html>
<head>
<title>Testing OAuth2 with Google</title>
</head>
<body>
<sec:authentication property="principal" var="principal" />
<sec:authorize access="isAuthenticated()">
	<ul>
		<li>Id: <c:out value="${principal.id}" /></li>
		<li>User name: <c:out value="${principal.username}" /></li>
		<li>Email: <c:out value="${principal.email}" /></li>
		<li>
			<span>Picture:</span>
			<img style="display: block; width: 128px; height: auto" src="<c:url value='${principal.picture}' />" />
		</li>
	</ul>
</sec:authorize>
</body>
</html>