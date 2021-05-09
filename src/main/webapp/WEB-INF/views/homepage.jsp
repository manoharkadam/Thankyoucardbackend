<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<sec:authentication property="principal" var="principal" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Price Glider</title>

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
    <script src="resources/js/amchart.js"></script>
    <script src="resources/js/serials.js"></script>
	<script src="resources/vendor/popper.js/popper.min.js"></script>
	

<script>

$(document).ready(function(){

	$.ajax({
		type : 'GET',
		url : 'rest/opportunity/getAllOpportunity?emailId=${principal.email}',
		dataType : "json",
		success : function(data) {
			
			var html = "Total Count "+ data.opportunityList.length + "<br>";
			for(var i = 0; i<data.opportunityList.length;i++){
				html += "<span class='opporunityClass myLabel' id= "+ data.opportunityList[i].salesForceOportunityID + ">" + data.opportunityList[i].opportunityName + "</span>";
			}
			$('#opportunityGraph').html(html)
			
			$("span.opporunityClass").click(function () {
				var salesForceOportunityID = $(this).attr('id');
				this.className += " active";
				$('#quotationGraph').html('');
				$('#productGraph').html('');
				var offset = $(this).offset();
				$("#quotationGraph").offset({ top: offset.top, left: offset.left+430});
				
			   $.post( "rest/opportunity/getAllQuotationForAdmin", {salesForceOportunityID: salesForceOportunityID })
              	  .done(function( data ) {
						
						var html = "Total Count "+ data.length + "<br>";
						for(var i = 0; i<data.length;i++){
							html += "<span class='quotationClass myLabel' id= "+ data[i].quotationID + ">" + data[i].accountLookup +"(" + data[i].quotationSAP + ")</span>";
						}
						$('#quotationGraph').html(html);
						
						$("span.quotationClass").click(function () {
							this.className += " active";
							var quotationId = $(this).attr('id');
							$('#productGraph').html('');
							var offset1 = $(this).offset();
							$("#productGraph").offset({ top: offset1.top, left: offset1.left+430});
							
							$.ajax({
			                    type: 'POST',
			                    url: 'rest/productDetails/getProductDetails',
			                    dataType: "json",
			                    contentType: 'application/json',
			                    data: JSON.stringify({'quotationId' : quotationId }),
			                    success: function (data) {
			                    	var html = "Total Count "+ data.productDetailsList.length + "<br>";
									for(var i = 0; i<data.productDetailsList.length;i++){
										html += "<span class='productClass myLabel' id= "+ data.productDetailsList[i].productID + ">" + data.productDetailsList[i].productLookup +" (" + data.productDetailsList[i].product + ")</span>";
									}
									$('#productGraph').html(html)
			                    }
					    	});  
						   
					    });
				});
		    });
		},
		error : function(e) {
			alert(e.responseText);
		}
	});	
	
});

</script>
</head>
<body class="sidebar-hidden header-fixed">
<div class="page-wrapper">
	<sec:authorize access="isAuthenticated()">

    <jsp:include page="commonNav.jsp" ></jsp:include>
    <div class="main-container">
        <jsp:include page="sideBar.jsp" ></jsp:include>
        <div class="content" style="height: 450px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            Price Glider Graph
                            <hr/>
                        </div>
                        <div id="chartdiv"></div>
                    </div>
                </div>

                <%-- <div class="col-md-3">
                    <div class="card">
                        <div class="card-header">
                            Employee Details
                            <hr/>
                        </div>
                        <div class="card-body">
                        	<form>
                            <div class="form-group">
                                <input id="name" class="form-control" type="text" name="name" placeholder="Name"/>
                            </div>
                            <hr class="hr-strike"/>
                            <p class="text-center or"><span class="or-span">OR</span></p>
                            <div class="form-group">
                                <select id="single-select" class="form-control">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                </select>
                            </div> 
                            <button type="button" class="btn btn-block btn-red" id="LoadRecordsButton">Load Records</button>
                            </form>
                        </div>
                    </div>
                    <button type="button" class="btn btn-block btn-red-lg" data-toggle="modal" data-target="#modal-1"><span class="add-icon">+</span><span class="btn-text" style="font-size: 1.0em;">Add New Records</span></button>
					
					<div class="modal fade" id="modal-1" tabindex="-1" role="dialog" style="display:none;" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Employee Details</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                        
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <input id="normal-input" class="form-control" placeholder="Name">
                                        </div>
                                        <div class="form-group">
                                            <input id="normal-input" class="form-control" placeholder="Email">
                                        </div>
                                        <div class="form-group">
                                            <input id="normal-input" class="form-control" placeholder="Contact">
                                        </div>
                                        <div class="form-group">
                                            <input id="normal-input" class="form-control" placeholder="Region">
                                        </div>
                                        <div class="form-group">
                                            <input id="normal-input" class="form-control" placeholder="Division">
                                        </div>
                                        <div class="form-group">
                                            <input id="normal-input" class="form-control" placeholder="Sales Office">
                                        </div>
                                        <div class="form-group">
                                            <input id="normal-input" class="form-control" placeholder="Role">
                                        </div>
                                        <div class="form-group">
                                            <input id="normal-input" class="form-control" placeholder="State">
                                        </div>
                                        <div class="form-group">
                                            <input id="normal-input" class="form-control" placeholder="Status">
                                        </div>
                                    </div>
                        
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-block btn-red">Add New Record</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div> --%>
            </div>
            <div class="row">
                <div class="col-md-12">
                	<div class="card">
                        <div class="card-header">
                            Opportunity Graph
                            <hr/>
                        </div>
                        <div id="opportunityGraph" style="width:400px;"></div>
                        <div id="quotationGraph" class="card" style="width:400px;"></div>
                        <div id="productGraph" class="card" style="width:400px;"></div>
                    </div>
                </div>
            </div>    
        </div>
    </div>
    </sec:authorize>
</div>
</body>
<script src="resources/js/funnelchartvalues.js"></script>

</html>