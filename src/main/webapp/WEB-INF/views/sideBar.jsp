<%@ page session="false"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<sec:authentication property="principal" var="principal" />
	<sec:authorize access="isAuthenticated()">
	<div class="sidebar">
            <nav class="sidebar-nav">
                <ul class="nav">
                    <li class="nav-title">Hi ${principal.username}</li>
                    <li class="nav-item">
                        <a href="homepage" class="nav-link active">DASHBOARD</a>
                    </li>
                    <li class="nav-item">
                        <a href="userManagement" class="nav-link">USER MANAGEMENT</a>
                    </li>
                    <li class="nav-item" id="aggregates">
                        <a href="uploadAggProductDiscount" class="nav-link">AGG PRODUCT DISCOUNT MATRIX</a>
                    </li>
                    <li class="nav-item" id="concrete" >
                        <a href="uploadConProductDiscount" class="nav-link">CONCRETE PRODUCT DISCOUNT MATRIX</a>
                    </li>
                    <!-- <li class="nav-item">
                        <a href="index.html" class="nav-link">UPLOAD EMPLOYEE DETAILS</a>
                    </li>
                    <li class="nav-item">
                        <a href="index.html" class="nav-link">PRODUCT DISCOUNT APPROVAL</a>
                    </li>
                    <li class="nav-item">
                        <a href="index.html" class="nav-link">UPLOAD EXCEL FILE</a>
                    </li>
                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">DROPDOWN <i class="fa fa-caret-down"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a href="#" class="nav-link">OPTION 1</a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">OPTION 2</a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">OPTION 3</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">METTIS CHARTS </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">LAST LINK </a>
                    </li> -->
                </ul>
            </nav>
        </div>
        </sec:authorize>
</body>
</html>