<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details</title>
<!-- Include one of jTable styles. -->
<link href="resources/css/metro/crimson/jtable.css" rel="stylesheet" type="text/css" />
<link href="resources/css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<!-- Include jTable script file. -->
<script src="resources/js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="resources/js/jquery.jtable.js" type="text/javascript"></script>
<style type="text/css">
.modal {
      display: block;
	  position: absolute !important;
	  z-index: 100;
	  width: auto;
	  height: auto;
	  background-color: rgba(192, 192, 192, 0.5);
	  background-image: url("resources/css/images/loader.gif");
	  background-repeat: no-repeat;
	  background-position: center;
	  background-size: 20%;
    }
.saveButton {
    float: right;
    padding: 8px 25px 8px 25px;
    margin-right: 10px;
   /*  background-color: #da0a0a; */
    border: 0px;
    }
select {
    width: 95%;
    height: 25px;
    color: black !important;
}
.approvalTable {
	width : 570px;	
	border-spacing : 0;
}
.approvalTable th, .approvalTable td{
	border: 1px solid #ddd;
    padding: 7px; 
}
div.jtable-main-container{
 	font-weight: normal;
    font-size: 13px;
}
.approvalTable th{ background-color : #da0a0a;}
.approvalTable tr:nth-child(even){background-color: #f9f9f9;}
.approvalTable tr:hover {background-color: #e8eaef;}
</style>
<script type="text/javascript">
$(function () {

	$('#EmployeeTableContainer').jtable({
            title: 'Employee Details',
            paging: true, 
            pageSize: 10,
            sorting: true,
            actions: {
                listAction: 'rest/getemployeeData/showEmployees',
                createAction:'rest/getemployeeData/saveEmployee',
                updateAction: 'rest/getemployeeData/updateEmployee',
                deleteAction: 'rest/getemployeeData/deleteEmployee'
            }, 
            fields: {
            	EmployeeID: {
                	title:'ID',
                    key: true,
                    list: true,
                    create:false,
                    edit: false
                },
                EmployeeName: {
                    title: 'Name',
                    width: '15%',
                    edit: true
                },
                EmployeeEmailID: {
                    title: 'Email',
                    width: '15%',
                    edit:true
                },
                EmpContactNo: {
                    title: 'Contact No',
                    width: '15%',
                    edit:true
                },
                Region: {
                    title: 'Region',
                    width: '15%',
                    options: { 'SEQ': 'SEQ', 'Country QLD': 'Country QLD' ,'NSW/ACT':'NSW/ACT','VIC/SA/TAS':'VIC/SA/TAS','WA/NT':'WA/NT','National':'National'},
                    list: false
                },
                Division: {
                    title: 'Division',
                    width: '15%',
                    edit:true
                },
                Sales_Office: {
                    title: 'Sales Office',
                    width: '15%',
                    edit: true
                }, 
                roleName: {
                    title: 'Role',
                    width: '15%',
                    options: 'rest/role/getAllRoles',
                    edit: true
                    
                }, 
                stateName: {
                    title: 'State',
                    width: '15%',
                    options: 'rest/state/getAllStates',
                    edit: true
                },
                EmpActiveStatus: {
                    title: 'Status',
                    width: '15%',
                    edit:true
                },
                Country: {
                    title: 'Country',
                    width: '15%',
                    edit:true,
                    list:false
                },
                Location: {
                    title: 'Location',
                    width: '15%',
                    edit:true,
                    list:false
                },
                EmpCompanyName: {
                    title: 'Company',
                    width: '15%',
                    edit:true,
                    list: false
                },
                SalesForce_UserID: {
                    title: 'Salesforce Id',
                    width: '15%',
                    edit:true,
                    list: false
                },
                OpcoName: {
                    title: 'Opco Name',
                    width: '15%',
                    edit:true,
                    list: false
                },ApprovalList: {
                    title: '',
                    width: '5%',
                    sorting: false,
                    edit: false,
                    create: false,
                    display: function (studentData) {
                        //Create an image that will be used to open child table
                        var $img = $('<img src="resources/css/images/approver.png" style="height: 15px; width: 15px;" title="Approval List" />');
                        $("#EmployeeDetTableContainer").dialog({
                        	title : "Approval Details", autoOpen : false, minHeight: 300, modal : true, show : "blind", hide : "blind", width: 600
                        });
                        //Open child table when user clicks the image
                        $img.click(function () {
                        	var empName = studentData.record.EmployeeName;
                        	var empRole = studentData.record.roleName;
                        	var empID = studentData.record.EmployeeID;
                        	
                        	if(empRole == 6){
                        		alert(empName + " is EGM, No Approval List");
                        		return false;
                        	}
                        	
                        	$("#EmployeeDetTableContainer").dialog("open");
                        	$('#EmployeeDetTableContainer').html('<div class="modal" style="display: none;"></div>');
                        	var roleDetail = {1:"Account Manager", 2:"Sales Manager", 3:"Commercial Manager", 4:"State Manager", 5: "National Manager", 6: "EGM"};
                        	
                        	 $(".modal").show();
                        	 $.post( "rest/employeeApproval/getApprovalList", {EmployeeID: empID , roleID : empRole})
                        	  .done(function( result ) {
                        		var html = '';
                        		if(result.Result == "AddData"){
                        			html = '<table class="approvalTable"><tr><th>Role</th><th>EmailID</th></tr>';
                        			for(var val in result.Record) {
                        				html += '<tr>';   
                                        html += '<td id="role' + val +'">' + roleDetail[val] + '</td>';   
                                        html += '<td id="emailID' + val +'"><select id="selectOpt' + val + '">';
                                        var size = result.Record[val].length
                                        for(var i = 0; i<size;i++) {
	    	                        	    html += '<option value=' + result.Record[val][i] +'>' +result.Record[val][i]+ '</option>';
	    	                        	}
	                              	    html += '</select></td></tr>'; 
                                	}  
                        		} else {
                        			html = '<table class="approvalTable"><tr><th>ID</th><th>Role</th><th>EmailID</th><th></th></tr>';  
                                    $.each(result, function (key, item) {  
                                    	var rolekey = item.roleName;
                                        html += '<tr>';  
                                        html += '<td id="empID' + rolekey +'">' + item.EmployeeID + '</td>';  
                                        html += '<td id="role' + rolekey +'">' + roleDetail[rolekey] + '</td>';   
                                        html += '<td id="emailID' + rolekey +'">' + item.EmployeeEmailID + '</td>';  
                                        html += '<td class="editButton" id="'+ rolekey +'"><img src="resources/css/metro/edit.png" title="Edit Approver" /></td>'; //<td><a id="">DELETE</a></td>';   
                                        html += '</tr>';  
                                    });
                        		}
                        		html += '</table class="approvalTable"><br><button class="saveButton" id="saveButton">SAVE</button></td>';
                        		$(".modal").hide();
                                $('#EmployeeDetTableContainer').html("Name : " + empName + "<br> Role : "  + roleDetail[empRole] + "<br><br>" + html );
                                
                                $("#saveButton").click(function(){
                                	var approvalEMail = "";
                                	for(var i=1;i<=6;i++){
                                		var elem = "#emailID"+i;
                                		var dropDownVal = "#selectOpt" + i + " option:selected";
                                		if($(dropDownVal).val() !=  undefined){
                                			approvalEMail += $(dropDownVal).val().toString() + ",";
                                		} else if($(elem).html() != undefined){
                                			approvalEMail += $(elem).html().toString() + ",";
                                		}
                                	}
                                	approvalEMail = approvalEMail.substr(0, approvalEMail.length-1);
                            	    
                                	$('#EmployeeDetTableContainer').html('<div class="modal" style="display: none;"></div>');
                                	$(".modal").show();
                            	    $.post( "rest/employeeApproval/saveApprovalList", { EmployeeID: empID, emailList: approvalEMail })
                              	  		.done(function( result ) {
                              	  		html = '<table class="approvalTable"><tr><th>ID</th><th>Role</th><th>EmailID</th><th></th></tr>';  
                              	  		$.each(result, function (key, item) {  
                                            html += '<tr>';
                                            html += '<td id="empID' + item.roleName +'">' + item.EmployeeID + '</td>';  
                                            html += '<td id="role' + item.roleName +'">' + roleDetail[item.roleName] + '</td>';   
                                            html += '<td id="emailID' + item.roleName +'">' + item.EmployeeEmailID + '</td>';  
                                            html += '<td><td class="editButton" id="'+ item.roleName +'"><img src="resources/css/metro/edit.png" title="Edit Approver" /></td></td>'; //<td><a id="">DELETE</a></td>';   
                                            html += '</tr>';  
                                        }); 
                                        html += '</table><br><button class="saveButton" id="saveButton">SAVE</button></td>';
                                        $(".modal").hide();
                                        $('#EmployeeDetTableContainer').html("Name : " + empName + "<br> Role : "  + roleDetail[empRole] + "<br><br>" + html );
                              	  	});
                            	}); //end save */
                            	
                                $(".editButton").click(function(){
                            		var roleval = $(this).attr('id');
                            	    var elem = "#emailID"+roleval;
                            	    
                            	    $('#EmployeeDetTableContainer').append('<div class="modal" style="display: none;"></div>');
                                	$(".modal").show();
                            	    $.post( "rest/employeeApproval/getApprovalBasedonRole", { roleID: roleval })
                          	  		.done(function( result ) {
	                             	    var s = '<select id="selectOpt' + roleval+ '">';
	 	                        	    for(var val in result) {
	 	                        	    	s += '<option value=' + result[val] +'>' +result[val]+ '</option>';
	 	                        	    }
	 	                        	    s += '</select>';
	 									$(elem).html(s);
	 									$(".modal").hide();
                          	  		});
                            	}); //end edit
                               
                        	  }); //end main post
                        	
                        }); //end image
                        //Return image to show on the person row
                        return $img;
                    }	//end display
                }	//approval lsit
            }
        });
	
	$('#LoadRecordsButton').click(function (e) {
		//alert("Hello");
		//alert($('#name').val());
        e.preventDefault();
        $('#EmployeeTableContainer').jtable('load', {
            name: $('#name').val()
        });
    });
	
	$('#LoadRecordsButton').click();
	$("#exportButton").click(function () {
	    	window.location = "rest/getemployeeData/exportEmployeeDetail";
	    	alert( "Excel file downloaded successfully" );
	});
});

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

</head>
<body>
	<div id="wrapper">
		<jsp:include page="commonNav2.jsp" ></jsp:include>
		<div id="page-wrapper" style="text-align:center;margin-left: 220px;">
		<!-- <div style="width:80%;margin-right:10%;margin-left:10%;"> -->
		<h3>Employee Detail page</h3>
			<div class="filtering">
			<form id="uploadform" method="post" enctype="multipart/form-data" action="rest/employeeApproval/uploadEmployeeDetails">
				Choose File to upload: <input type="file" name="file" id="file"><br>
			</form>
			<button id="upload" value="Upload">Upload</button>	
			</div>
			<br><div id="message"></div>
		<div class="filtering">
		    <form>
		        Name: <input type="text" name="name" id="name" />
		        <button type="submit" id="LoadRecordsButton">Load records</button>
		    </form>
		</div>
		<div id="EmployeeTableContainer"></div>
		<div id="EmployeeDetTableContainer"></div>
		<br>&nbsp;&nbsp;
		<button id="exportButton" style= "float: left">Export</button>
		</div>
	</div>
</body>
</html>