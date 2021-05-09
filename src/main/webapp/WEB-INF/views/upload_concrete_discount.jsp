<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CONCRETE PRODUCT DISCOUNT</title>
	<link rel="stylesheet" href="resources/vendor/simple-line-icons/css/simple-line-icons.css"/>
    <link rel="stylesheet" href="resources/vendor/font-awesome/css/fontawesome-all.min.css"/>
    <link rel="stylesheet" href="resources/css/styles.css"/>
    <link rel="stylesheet" href="resources/css/custom.css"/>
    <link rel="stylesheet" href="resources/css/jsgrid.min.css" />
	<link rel="stylesheet" href="resources/css/jsgrid-theme.min.css" />
	<link rel="stylesheet" href="resources/css/jquery-ui-1.10.3.custom.css"  />
	
	<script src="resources/js/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="resources/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
	<script src="resources/js/jsgrid.min.js" type="text/javascript"></script>	
	<script src="resources/js/custom.js"></script>

<script type="text/javascript">
$(document).ready(function(){
    $("#upload").click(function(){
    	if($("#file").val() == ""){
    		alert("Please select the file to upload");
    		return false;
    	}
    	$('#message').html('<div class="modal" style="display: none;"></div>');
    	$(".modal").show();
    	$.ajax({
		    url: 'rest/employeeApproval/uploadProductDiscount',
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
    $("#exportButton").click(function () {
    	window.location = "rest/employeeApproval/exportConcreteDiscount";
    	alert( "Excel file downloaded successfully" );
    });

    $("#jsGrid").jsGrid({
        width: "100%",
        //height: "600px",
        
        filtering: true,
        editing: true,
        sorting: true,
        paging: true,
        autoload: true,
        inserting: true,
 
        pageSize: 15,
        pageButtonCount: 5,
        
        controller: {
            loadData: function(filter) {
            	var d = $.Deferred();
                $.ajax({
                    type: 'GET',
                    url: 'rest/employeeApproval/getAllConcreteDiscount',
                    dataType: "json",
                    success: function (data) {
                    	  var data1 = $.grep(data, function(data) {
                            return (!filter.salesOffice || data.salesOffice.indexOf(filter.salesOffice) > -1)
                            	&& (!filter.region || data.region.toUpperCase().indexOf(filter.region.toUpperCase()) > -1)
                            	&& (!filter.salesGroup || data.salesGroup.indexOf(filter.salesGroup) > -1)
                            	&& (!filter.discountAmtofKAMAMCODMgr || data.discountAmtofKAMAMCODMgr == filter.discountAmtofKAMAMCODMgr)
                            	&& (!filter.discountAmtofSalesMgr || data.discountAmtofSalesMgr == filter.discountAmtofSalesMgr)
                            	&& (!filter.discountAmtofCMLAMMgr || data.discountAmtofCMLAMMgr == filter.discountAmtofCMLAMMgr)
                            	&& (!filter.discountAmtofRCMMgr || data.discountAmtofRCMMgr == filter.discountAmtofRCMMgr)
                            	&& (!filter.discountAmtofGMMgr || data.discountAmtofGMMgr == filter.discountAmtofGMMgr)
                            	&& (!filter.discountAmtofNSMMMgr || data.discountAmtofNSMMMgr == filter.discountAmtofNSMMMgr)
                            	&& (!filter.discountAmtofEGMMgr || data.discountAmtofEGMMgr == filter.discountAmtofEGMMgr);
                        }); 
                    	d.resolve(data1); 
                    },
                    error: function(e) {
                        alert("error: " + e.responseText);
                    }
                });
                return d.promise();
            },
    
		    insertItem: function(insertingClient) {
		        $.ajax({
                    type: 'POST',
                    url: 'rest/employeeApproval/saveConcreteDiscount',
                    dataType: "json",
                    contentType: 'application/json',
                    data: JSON.stringify(insertingClient),
                    success: function (data) {
                    	alert("insertion done successfully");
                    }
		    	});
		    },
		
		    updateItem: function(updatingClient) {
		    	 $.ajax({
                    type: 'POST',
                    url: 'rest/employeeApproval/updateConcreteDiscount',
                    dataType: "json",
                    contentType: 'application/json',
                    data: JSON.stringify(updatingClient),
                    success: function (data) {
                    	alert("updation done successfully");
                    }
		    	});  
		    },
		
		    deleteItem: function(deletingClient) {
		    	$.ajax({
                    type: 'POST',
                    url: 'rest/employeeApproval/deleteConcreteDiscount',
                    dataType: "json",
                    contentType: 'application/json',
                    data: JSON.stringify(deletingClient),
                    success: function (data) {
                    	alert("deletion done successfully");
                    }
		    	});  
		    }

        },    	
    	
        fields: [
        	{ name: "salesOffice", type: "text",  validate: "required",  width:90, title: "SalesOffice" },
            { name: "region", type: "text", width:230,  title: "Region"},
            { name: "salesGroup", type: "text", width:65,  title: "SalesGroup"},
            { name: "discountAmtofKAMAMCODMgr", type: "text", width:75,  title: "KAM AM COD Mgr" },
            { name: "discountAmtofSalesMgr", type: "text", width:75,  title: "Sales Mgr" },
            { name: "discountAmtofCMLAMMgr", type: "text", width:75,  title: "CM LAM Mgr" },
            { name: "discountAmtofRCMMgr", type: "text",   width:75,title: "RCM Mgr" },
            { name: "discountAmtofGMMgr", type: "text",  width:75,title: "GM Mgr" },
            { name: "discountAmtofNSMMMgr", type: "text",  width:75,title: "NSMM Mgr"},
            { name: "discountAmtofEGMMgr", type: "text", width:75, title: "EGM Mgr"},
            { type: "control" }
        ]
    });
 });
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
.jsgrid-table {
    /* width: auto !important; */
    font-size: small;
}
.jsgrid-grid-header, .jsgrid-grid-body {
     overflow-y: hidden;
} 
</style>
</head>
<body>
<body class="sidebar-hidden header-fixed">
<div class="page-wrapper">

    <jsp:include page="commonNav.jsp" ></jsp:include>
    <div class="main-container">
        <jsp:include page="sideBar.jsp" ></jsp:include>
        <div class="content" >
        <div class="row">
			<h3>Product Discount Page </h3>
			<br><br>
				<div>
				<form id="uploadform" method="post" enctype="multipart/form-data" action="rest/employeeApproval/uploadProductDiscount">
					Choose File to upload: <input type="file" name="file" id="file"/>
					<input type="hidden" name="division" id="concrete" value="concrete"/><br>
				</form>
				<button id="upload" value="Upload">Upload</button>	
				</div>
				<br><div id="message"></div>
				<div id="jsGrid"></div>
				<button id="exportButton">Export</button>
		</div>
		</div>
	</div>
</div>
</body>
<script>
	 

</script>
</html>