<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>USER MANAGEMENT</title>
	<link href="resources/css/metro/crimson/jtable.css" rel="stylesheet" type="text/css" />
	<link href="resources/css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="resources/vendor/simple-line-icons/css/simple-line-icons.css"/>
    <link rel="stylesheet" href="resources/vendor/font-awesome/css/fontawesome-all.min.css"/>
    <link rel="stylesheet" href="resources/css/styles.css"/>
    <link rel="stylesheet" href="resources/css/custom.css"/>
    
	<script src="resources/js/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="resources/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
	<script src="resources/js/jquery.jtable.js" type="text/javascript"></script>
	<script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.metisMenu.js"></script>
	<script src="resources/js/custom.js"></script>
	<script src="resources/js/employee.js"></script>
    <script src="resources/js/amchart.js"></script>
    <script src="resources/js/serials.js"></script>
	<script src="resources/vendor/popper.js/popper.min.js"></script>
	
    
</head>
<body class="sidebar-hidden header-fixed">
<div class="page-wrapper">
	<sec:authentication property="principal" var="principal" />
	<sec:authorize access="isAuthenticated()">

    <jsp:include page="commonNav.jsp" ></jsp:include>
    <div class="main-container">
    	<jsp:include page="sideBar.jsp" ></jsp:include>
        <div class="content" >
			<div class="row">
                <div class="col-md-12">
                	<button type="button" class="btn btn-block btn-red" id="LoadRecordsButton">Load Records</button>
					<div id="EmployeeTableContainer"></div>
					<div id="EmployeeDetTableContainer"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
					<form id="uploadform" method="post" enctype="multipart/form-data" action="rest/employeeApproval/uploadEmployeeDetails">
						Choose File to upload: <input type="file" name="file" id="file"><br>
					</form>
					<button id="upload" value="Upload" type="button" class="btn btn-block btn-red">Upload</button>	  
					<br><div id="message"></div>
                </div>
                <div class="col-md-3">
                	<button id="exportButton" type="button" class="btn btn-block btn-red">Export</button>
                </div>
                <div class="col-md-6"></div>
            </div>
        </div>
    </div>
	</sec:authorize>
</div>
</body>
</html>