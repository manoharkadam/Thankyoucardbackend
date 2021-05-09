<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Discount based on Product</title>
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
    	//$('.jsgrid-table').tableExport({type: 'excel', escape: 'false'});    
    	/* $.ajax({
            type: 'GET',
            url: 'rest/employeeApproval/getAllStateDiscount2',
            success: function (data) {
            	alert("insertion done successfully");
            }
    	}); */
    	window.location = "rest/employeeApproval/exportStateDiscount";
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
                    url: 'rest/employeeApproval/getAllStateDiscount',
                    dataType: "json",
                    success: function (data) {
                    	 var data1 = $.grep(data, function(data) {
                            return (!filter.product || data.product.indexOf(filter.product) > -1)
                            	&& (!filter.materialDescription || data.materialDescription.toUpperCase().indexOf(filter.materialDescription.toUpperCase()) > -1)
                            	&& (!filter.plntCode || data.plntCode.indexOf(filter.plntCode) > -1)
                            	&& (!filter.stateID || data.stateID == filter.stateID)
                            	&& (!filter.discountAmtofAccountMgr || data.discountAmtofAccountMgr == filter.discountAmtofAccountMgr)
                            	&& (!filter.discountAmtofSalesMgr || data.discountAmtofSalesMgr == filter.discountAmtofSalesMgr)
                            	&& (!filter.discountAmtofCommercialMgr || data.discountAmtofCommercialMgr == filter.discountAmtofCommercialMgr)
                            	&& (!filter.discountAmtofStateMgr || data.discountAmtofStateMgr == filter.discountAmtofStateMgr)
                            	&& (!filter.discountAmtofNationalMgr || data.discountAmtofNationalMgr == filter.discountAmtofNationalMgr)
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
                    url: 'rest/employeeApproval/saveStateDiscount',
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
                    url: 'rest/employeeApproval/updateStateDiscount',
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
                    url: 'rest/employeeApproval/deleteStateDiscount',
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
        	{ name: "product", type: "text",  validate: "required",  width:90, title: "Material" },
            { name: "stateID", type: "number",  title: "State" ,width:50 }, 
            { name: "materialDescription", type: "text", width:230,  title: "Description"},
            { name: "plntCode", type: "text", width:65,  title: "Plant"},
            { name: "discountAmtofAccountMgr", type: "text",  width:75, title: "Account Mgr"},
            { name: "discountAmtofSalesMgr", type: "text", width:75,  title: "Sales Mgr" },
            { name: "discountAmtofCommercialMgr", type: "text",   width:75,title: "Comm Mgr" },
            { name: "discountAmtofStateMgr", type: "text",  width:75,title: "State Mgr" },
            { name: "discountAmtofNationalMgr", type: "text",  width:75,title: "National Mgr"},
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
					Choose File to upload: <input type="file" name="file" id="file"><br>
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