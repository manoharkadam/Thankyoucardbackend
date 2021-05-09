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
<title>Price Glider</title>
<script>
	$(document).ready(function(){
		var employee;
		
		$.post( "rest/getemployeeData/getAdminDetails", {EmployeeEmail:  $('#userEmail').val() })
		  .done(function( result ) {
			  employee = result;
			  if(employee.division=="Aggregates"){
				  $("#aggregates").show();
				  $("#concrete").hide();
			  }else{
				  $("#concrete").show();
				  $("#aggregates").hide();
			  }
		});
		
		$("#profile").click(function () {
			$('.dropdown-menu').removeClass('show');
			$("#employeeProfile").dialog({
	        	title : "Profile", autoOpen : false, minHeight: 300, modal : true, show : "blind", hide : "blind", width: 600
	        });
			var html = '<table class="approvalTable "><tr><td>Name : </td><td>'+ employee.employeeName +'</td></tr>';
			html += '<tr><td>EmailID : </td><td>'+ employee.employeeEmailID +'</td></tr>';
			html += '<tr><td>Sales Office : </td><td>'+ employee.sales_Office +'</td></tr>';
			html += '<tr><td>EmailID : </td><td></td></tr>';
			html += '<tr><td>EmailID : </td><td></td></tr>';
			html += '</table>';  
			$('#employeeProfile').html(html);
			$("#employeeProfile").dialog("open");
			
		});
	});
</script>
</head>
<body>
	<sec:authentication property="principal" var="principal" />
	<sec:authorize access="isAuthenticated()">
	<input type="hidden" id="userEmail" value= "${principal.email}"/>
	<nav class="navbar page-header">
        <a href="#" class="btn btn-link sidebar-mobile-toggle d-md-none mr-auto">
            <i class="fa fa-bars"></i>
        </a>

        <a href="#" class="btn btn-link sidebar-toggle d-md-down-none">
            <i class="fa fa-bars"></i>
        </a>

        <a class="navbar-brand" href="homepage">
            PRICE GLIDER
        </a>

        <ul class="navbar-nav ml-auto">
            <!-- <li class="nav-item d-md-down-none">
                <a href="#">See Website</a>
            </li>

            <li class="nav-item d-md-down-none">
                <a href="#">Open Ticket</a>
            </li>

            <li class="nav-item d-md-down-none">
                <a href="#">Report Bug</a>
            </li> -->

            <li class="nav-item d-md-down-none">
                <a href="logout">Logout <i class="icon icon-power"></i></a>
            </li>

            <li class="nav-item dropdown account-right">
                <a class="nav-link dropdown-toggle" href="#" id="user-dropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="resources/css/images/user-generic.png" class="avatar avatar-sm" alt="logo">
                    <span class="d-md-down-none">${principal.username}</span>
                </a>

                <div class="dropdown-menu dropdown-menu-right account-dropdown">
                    <div class="dropdown-header">Account</div>

                    <a href="#" id="profile" class="dropdown-item">
                        <i class="fa fa-user"></i> Profile
                    </a>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-envelope"></i> Messages
                    </a>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-bell"></i> Notifications
                    </a>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-wrench"></i> Settings
                    </a>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-lock"></i> Logout
                    </a>
                </div>
            </li>
        </ul>
        <div id="employeeProfile"></div>
    </nav>
    </sec:authorize>
</body>
</html>