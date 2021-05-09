
$(function () {

	var employee;
	var empDivision;
	
	$.post( "rest/getemployeeData/getAdminDetails", {EmployeeEmail:  $('#userEmail').val() })
	  .done(function( result ) {
		  employee = result;
		  empDivision = result.division;
		  $('#EmployeeTableContainer').jtable('load', {
            division: empDivision
        });
    });
	
	$('#EmployeeTableContainer').jtable({
            title: 'User management',
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
                    options: function(data) {
                    	// data.record.userDivision replace with empDivision changed by Pratyusendu on 21-July-2018
                        if (empDivision == 'Concrete') {
                            return 'rest/role/getAllRoles?division=Concrete';
                        }
                        return 'rest/role/getAllRoles?division=Aggregates';
                    },
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
                        	var division = studentData.record.Division;
                        	var empID = studentData.record.EmployeeID;
                        	
                        	var roleDetail = {};
                        	
                        	if(division.toUpperCase() == "Concrete".toUpperCase()){
                        		roleDetail = {1: "KAM/AM/COD", 2: "SM", 3:"CM/LAM", 4:"RCM", 5:"GM", 6:"NSMM", 7:"EGM"};
                        		if(empRole == 7){
                            		alert(empName + " is EGM, No Approval List");
                            		return false;
                            	}
                        	} else {
                        		roleDetail = {1:"Account Manager", 2:"Sales Manager", 3:"Commercial Manager", 4:"State Manager", 5: "National Manager", 6: "EGM"};
                        		if(empRole == 6){
                            		alert(empName + " is EGM, No Approval List");
                            		return false;
                            	}
                        	}
                        	
                        	$("#EmployeeDetTableContainer").dialog("open");
                        	$('#EmployeeDetTableContainer').html('<div class="modal" style="display: none;"></div>');
                        	
                        	
                        	 $(".modal").show();
                        	 $.post( "rest/employeeApproval/getApprovalList", {EmployeeID: empID , roleID : empRole, division : division })
                        	  .done(function( result ) {
                        		var html = '';
                        		if(result.Result == "AddData"){
                        			html = '<table class="approvalTable"><tr><th>Role</th><th>EmailID</th></tr>';
                        			for(var val in result.Record) {
                        				html += '<tr>';   
                                        html += '<td id="role' + val +'">' + roleDetail[val] + '</td>';   
                                        html += '<td id="emailID' + val +'"><select id="selectOpt' + val + '">';
                                        var size = result.Record[val].length;
                                        html += '<option value=""></option>';
                                        for(var i = 0; i<size;i++) {
	    	                        	    html += '<option value=' + result.Record[val][i] +'>' +result.Record[val][i]+ '</option>';
	    	                        	}
	                              	    html += '</select></td></tr>'; 
                                	}  
                        		} else {
                        			html = '<table class="approvalTable"><tr><th>ID</th><th>Role</th><th>EmailID</th><th></th></tr>';  
                        			
                                    for(var i = parseInt(empRole)+1; i<=7;i++){
                                    	var employeeDetail =  result.filter(function(empDetail) {
                            				return empDetail.roleName == i;
                            			});
                                    	if(employeeDetail.length > 0){
                                    		 html += '<tr>';  
                                             html += '<td id="empID' + i +'">' + employeeDetail[0].EmployeeID + '</td>';  
                                             html += '<td id="role' + i +'">' + roleDetail[i] + '</td>';   
                                             html += '<td id="emailID' + i +'">' + employeeDetail[0].EmployeeEmailID + '</td>';  
                                             html += '<td class="editButton" id="'+ i +'"><img src="resources/css/metro/edit.png" title="Edit Approver" /></td>'; //<td><a id="">DELETE</a></td>';   
                                             html += '</tr>'; 
                                    	} else if(undefined != roleDetail[i]){
                                    		html += '<tr>';  
                                            html += '<td id="empID' + i +'"></td>';  
                                            html += '<td id="role' + i +'">' + roleDetail[i] + '</td>';   
                                            html += '<td id="emailID' + i +'"></td>';  
                                            html += '<td class="editButton" id="'+ i +'"><img src="resources/css/metro/edit.png" title="Edit Approver" /></td>'; //<td><a id="">DELETE</a></td>';   
                                            html += '</tr>'; 
                                    	}
                                            
                                   }
                        			/*$.each(result, function (key, item) {  
                                    	var rolekey = item.roleName;
                                        html += '<tr>';  
                                        html += '<td id="empID' + rolekey +'">' + item.EmployeeID + '</td>';  
                                        html += '<td id="role' + rolekey +'">' + roleDetail[rolekey] + '</td>';   
                                        html += '<td id="emailID' + rolekey +'">' + item.EmployeeEmailID + '</td>';  
                                        html += '<td class="editButton" id="'+ rolekey +'"><img src="resources/css/metro/edit.png" title="Edit Approver" /></td>'; //<td><a id="">DELETE</a></td>';   
                                        html += '</tr>';  
                                    });*/
                        		}
                        		html += '</table><br><button class="saveButton" id="saveButton">SAVE</button></td>';
                        		$(".modal").hide();
                                $('#EmployeeDetTableContainer').html("Name : " + empName + "<br> Role : "  + roleDetail[empRole] + "<br> Division : "  + division + "<br><br>" + html );
                                
                                $("#saveButton").click(function(){
                                	var approvalEMail = "";
                                	for(var i=1;i<=7;i++){
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
                            	    $.post( "rest/employeeApproval/saveApprovalList", { EmployeeID: empID, division : division, emailList: approvalEMail })
                              	  		.done(function( result ) {
                              	  		html = '<table class="approvalTable"><tr><th>ID</th><th>Role</th><th>EmailID</th><th></th></tr>';  

                                        for(var i = parseInt(empRole)+1; i<=7;i++){
                                        	var employeeDetail =  result.filter(function(empDetail) {
                                				return empDetail.roleName == i;
                                			});
                                        	if(employeeDetail.length > 0){
                                        		 html += '<tr>';  
                                                 html += '<td id="empID' + i +'">' + employeeDetail[0].EmployeeID + '</td>';  
                                                 html += '<td id="role' + i +'">' + roleDetail[i] + '</td>';   
                                                 html += '<td id="emailID' + i +'">' + employeeDetail[0].EmployeeEmailID + '</td>';  
                                                 html += '<td class="editButton" id="'+ i +'"><img src="resources/css/metro/edit.png" title="Edit Approver" /></td>'; //<td><a id="">DELETE</a></td>';   
                                                 html += '</tr>'; 
                                        	} else if(undefined != roleDetail[i]){
                                        		html += '<tr>';  
                                                html += '<td id="empID' + i +'"></td>';  
                                                html += '<td id="role' + i +'">' + roleDetail[i] + '</td>';   
                                                html += '<td id="emailID' + i +'"></td>';  
                                                html += '<td class="editButton" id="'+ i +'"><img src="resources/css/metro/edit.png" title="Edit Approver" /></td>'; //<td><a id="">DELETE</a></td>';   
                                                html += '</tr>'; 
                                        	}
                                       }
                              	  		/*  $.each(result, function (key, item) {  
                                            html += '<tr>';
                                            html += '<td id="empID' + item.roleName +'">' + item.EmployeeID + '</td>';  
                                            html += '<td id="role' + item.roleName +'">' + roleDetail[item.roleName] + '</td>';   
                                            html += '<td id="emailID' + item.roleName +'">' + item.EmployeeEmailID + '</td>';  
                                            html += '<td class="editButton" id="'+ item.roleName +'"><img src="resources/css/metro/edit.png" title="Edit Approver" /></td>'; //<td><a id="">DELETE</a></td>';   
                                            html += '</tr>';  
                                        });*/ 
                                        html += '</table><br><button class="saveButton" id="saveButton">SAVE</button></td>';
                                        $(".modal").hide();
                                        $('#EmployeeDetTableContainer').html("Name : " + empName + "<br> Role : "  + roleDetail[empRole] + "<br> Division : "  + division + "<br><br>" + html );
                                        $(".editButton").click(function(){
                                        	
                                        	var roleval = $(this).attr('id');
                                    	    var elem = "#emailID"+roleval;
                                    	    
                                    	    $('#EmployeeDetTableContainer').append('<div class="modal" style="display: none;"></div>');
                                        	$(".modal").show();
                                    	    $.post( "rest/employeeApproval/getEmployeeBasedOnRoleAndDivision", { roleID: roleval , division : division})
                                  	  		.done(function( result ) {
        	                             	    var s = '<select id="selectOpt' + roleval+ '">';
        	                             	    s += '<option value=""></option>';
        	 	                        	    for(var val in result) {
        	 	                        	    	s += '<option value=' + result[val] +'>' +result[val]+ '</option>';
        	 	                        	    }
        	 	                        	    s += '</select>';
        	 									$(elem).html(s);
        	 									$(".modal").hide();
                                  	  		});
                                    	}); //end edit
                              	  	});
                            	}); //end save */
                            	
                                $(".editButton").click(function(){
                                	
                                	var roleval = $(this).attr('id');
                            	    var elem = "#emailID"+roleval;
                            	    
                            	    $('#EmployeeDetTableContainer').append('<div class="modal" style="display: none;"></div>');
                                	$(".modal").show();
                            	    $.post( "rest/employeeApproval/getEmployeeBasedOnRoleAndDivision", { roleID: roleval , division : division})
                          	  		.done(function( result ) {
	                             	    var s = '<select id="selectOpt' + roleval+ '">';
	                             	    s += '<option value=""></option>';
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
	
	$("#exportButton").click(function () {
	    	window.location = "rest/getemployeeData/exportEmployeeDetail?division=" + empDivision;
	    	alert( "Excel file downloaded successfully" );
	});
		
});

