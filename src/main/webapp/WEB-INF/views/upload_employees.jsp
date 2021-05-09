<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Employee Details</title>
<link href="resources/css/metro/crimson/jtable.css" rel="stylesheet" type="text/css" />
<link href="resources/css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<!-- Include jTable script file. -->
<script src="resources/js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="resources/js/jquery.jtable.js" type="text/javascript"></script>

<script>
$(document).ready(function(){
    $("#upload").click(function(){
    	if($("#file").val() == ""){
    		alert("Please select the file to upload");
    		return false;
    	}
    	$('#message').html('<div class="modal" style="display: none;"></div>');
    	$(".modal").show();	 
		$.ajax({
		    url: 'rest/employeeApproval/uploadEmployeeDetails',
		    data: new FormData($("#uploadform")[0]),
		    dataType: 'text',
		    processData: false,
		    contentType: false,
		    type: 'POST',
		    success: function(result){
		    	$(".modal").hide();
            	if(result == "OK") {
    	  	        $('#message').html("File uploaded successfully");
    	  		} else {
    	  			alert(result);
    	  		}
            	$("#file").val("");
		    }, error: function (e) {
	            $("#message").text(e.responseText);
	            console.log("ERROR : ", e);
	        }
		});
    });
    
})	

</script>
<style type="text/css">
.modal {
      display: block;
	  position: absolute;
	  z-index: 100;
	  background-color: rgba(192, 192, 192, 0.5);
	  background-image: url("resources/css/images/loader.gif");
	  background-repeat: no-repeat;
	  background-position: center;
	  background-size: 20%;
    }
</style>
</head>
<body>
<div id="wrapper">
	<jsp:include page="commonNav2.jsp" ></jsp:include>
	<div id="page-wrapper" style="margin-left: 220px;">
	<h3>Upload Employee Details File </h3>
		<div class="filtering">
		<form id="uploadform" method="post" enctype="multipart/form-data" action="rest/employeeApproval/uploadEmployeeDetails">
			Choose File to upload: <input type="file" name="file" id="file"><br>
		</form>
		<button id="upload" value="Upload">Upload</button>	
		</div>
		<br><div id="message"></div>
	</div>

</div>
</body>
</html>