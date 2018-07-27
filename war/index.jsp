<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Interview Scheduling</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css">  -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
#top-header {
	text-align: center;
	background-color: #3e3c3b;
	color: #b2b9bc;
	margin: -8px;
	padding: 12px;
	font-size: 30px;
}

body {
	background: #f5f3f3;
}

#leftdiv {
	position: absolute;
	left: 24px;
	height: 100%;
	width: 32%;
}

#centerdiv {
	position: absolute;
	left: 35%;
	height: 100%;
	width: 30%;
}

#rightdiv {
	position: absolute;
	right: 15px;
	height: 100%;
	width: 35%;
}

#container {
	
}

#form-table {
	background: #f7f7f7;
	width: 95%;
	height: 490px;
	margin-top: 50px;
	margin-left: 10px;
	border: 1px solid #d2cfcf;
	position: absolute;
}

#table-section {
	width: 100%;
	height: 400px;
}

#table-section input{
	width:80%;
}

td.column1 {
	padding-left: 25px;
	padding-top: 20px;
}

td.column2 {
	padding-top: 20px;
}

.textfield {
	font-size: 20px;
}

#schedule-button {
	text-align: center;
	padding-top: 20px;
}

button {
	padding: 10px 20px;
	display: inline-block;
	margin: auto;
	background: white;
	box-shadow: none;
	border: none;
	color: #000;
	font-size: 16px;
	border-radius: 15px;
	box-shadow: 0 0 2px 1px #0000001a;
}

#datepickerfield {
	margin-top: 50px;
	margin-left: 30px;
	font-size: 15px;
	position: absolute;
}

#datepicker {
	font-size: 15px;
	margin-bottom: 20px;
	padding: 4px;
}

#timeslot_list {
	background-color: #f3f1f0;
	height: 15px;
	width: 50px;
	font-weight: 700;
	padding: 5px;
	text-align: center;
	text-decoration: none;
	border: 1px solid #d2cfcf;
	border-radius: 2px;
	margin-bottom: 10px;
	display: block;
}

#appointmentInformation_div {
	background: #f7f7f7;
	width: 80%;
	height: 300px;
	margin-top: 50px;
	border: 1px solid #d2cfcf;
}

#aaptInfo_table {
	padding: 20px;
}

#conform_button {
	margin-left: 35%;
	margin-top: 30px;
}

td.right_column1 {
	margin-top: 20%
}

td {
	margin-top: 20px;
}

.parent_page{
width: 80%;
    height: 100%;
    position: absolute;
}
#popup-message{
	margin-top: 40%;
    background-color: #e8e6e5;
    border: 1px solid #bfb5b5;
    height: 10%;
    padding-left: 14%;
    padding-top: 6%;
    box-shadow: 8px 10px #6f6767;
    }

</style>
<script>
		  $( function() {
			  $( "#datepicker" ).datepicker({
			    	dateFormat: 'dd/mm/yy',
			    	minDate: 0, maxDate: "+1M +20D"
			   });
			  
			  $("#datepicker").datepicker().datepicker("setDate", new Date());
			  
			  	$(".hasDatepicker").datepicker({
				    onSelect: function(dateText) {
				      $(this).change();
				    }
				  }).on("change", function() {
					  var selecteddate = $( "#mySelect" ).val();
					  generateTimeSlots(window.staffCollection, selecteddate );
				  });

			  
		    
		  } );
	 </script>
</head>
<script>
			   	$(document).ready(function(){
			   	$("p").fadeOut(3000);	
			   	});
	   	
		</script>


<body>

	<!--   <script>
  	function validate(){
  		
  		console.log("inside function");
  		
  					$.ajax({
  							url:"/interviewscheduling",
  							type:"POST",
  							success : function()
  							{
  								console.log("success");
  								
  							}
  					})
  				}
  </script>  -->

	<!-- <script>
  
  
  function validation(){
	  
	  var firstname = document.getElementById("firstname").value;
	  console.log(firstname);
	  var email = document.getElementById("email").value;
	  
	  if((firstname =="")||(email == "")){
		  
		  alert("Enter all mandatory fields");
	  }
	  
	  
  }
  </script> -->

	<div id="top-header">Interview Scheduling</div>
	
	<!-- <div id = "popupdiv" >
		<p id = "message">Thank you for scheduling an interview! </p> -->
		<div>
		<div id="parent_page" >
		
		<div id="leftdiv">
			<div id="container">

				<p>
					<% if(request.getAttribute("errormsg")!=null){%>
					<%=request.getAttribute("errormsg")%>
					<%}
				else{}%>
				</p>
				<div id="form-table">


					<table id="table-section">
						<tr>
							<td class="column1">First Name*:</td>
							<td class="column2"><input type="text" class="textfield"
								id="firstname" name="firstname" /></td>
						</tr>
						<tr>
							<td class="column1">Last Name :</td>
							<td class="column2"><input type="text" class="textfield"
								id="lastname" name="lastname" /></td>
						</tr>
						<tr>
							<td class="column1">Email*:</td>
							<td class="column2"><input type="text" class="textfield"
								id="email" name="emailaddress" /></td>
						</tr>
						<tr>
							<td class="column1">Mobile :</td>
							<td class="column2"><input type="text" class="textfield"
								id="phone" /></td>
						</tr>
						<tr>
							<td class="column1">Year of Passing :</td>
							<td class="column2"><input type="text" class="textfield"
								id="yearofpassing" /></td>
						</tr>
						<tr>
							<td class="column1">Whom to meet :</td>
							<td class="column2"><select class="textfield" id="mySelect"></select>
							</td>
						</tr>
					</table>

					<div id="schedule-button">
						<button id="create_customer">Pick a Slot</button>
					</div>

				</div>
			</div>
		</div>

			<div id="centerdiv">
			<p id = "popup-message" style="display: none"></p>
				<div id="timeslot_div" style="display: none">
					<div id="datepickerfield">
						Date: <br> <input type="text" class="textfield"
							id="datepicker" name="datepicker" />

						<p id="noslotsmessage"></p>
						
						<ul id="timeslots_ul"></ul>
					</div>
				</div>
			</div>
			<div id="rightdiv">

			<div id="appointmentInformation_div" style="display: none">

				<table id="aaptInfo_table">
					 <tr>
						<td>Confirm Your Info,</td>
					</tr> 
					<tr>
						<td class="right_column1">Interviewer&nbsp:</td>
						<td class="right_column2"><span id="staffName"></span></td>
					</tr>
					<tr>
						<td class="right_column1">Date & Time&nbsp:</td>
						<td class="right_column2"><span id="selected_date"></span> &nbsp
						<span id="selected_time"></span></td>
					</tr>
					<tr>
						<td class="right_column1">Your Info &nbsp: </td>
						<td class="right_column2"><span id="customer_name"></span></td>
					</tr>
					<tr>
						<td class="right_column1"></td>
						<td class="right_column2"><span id="customer_email"></span></td>
					</tr>
				</table>
				<button id="conform_button">Confirm</button>
			</div>
		</div>
		</div>
		
		</div>
		

	

	<script>
    window.accesstoken;
    var customerDetails = {};
    var staffDetails = {};
    var timeslotsDetails = {};
    var appointmentDetails = {};
    
    $(document).ready(function() {
    	
    	generateAccessToken();
    	fetchStaff();
    	$("#create_customer").click(function(e){
    		
    		var firstName 		= 	$("#firstname").val();
    		var lastName 		= 	$("#lastname").val();
    		var email 			= 	$("#email").val();
    		var phone 			= 	$("#phone").val();
    		var yearofpassing 	= 	$("#yearofpassing").val();
    		var whomtomeet 		= 	$("#whomtomeet").val();
    		
    		
    		customerDetails.first_name 			= 	firstName;
    		customerDetails.last_name 			= 	lastName; 
    		customerDetails.email_id	 		= 	email;
    		customerDetails.cell_phone 			= 	phone;
    		//customerDetails.additional_fields	=	{'value' :'{'yearofpassing' :'yearofpassing','whomtomeet':'whomtomeet'}'}  ;
    		//customerDetails.additional_fields	= 	whomtomeet ;
    		console.log(customerDetails);
    		
    	    createCustomer(); 
    	   
   		 });
    	$("#conform_button").click(function(e){
    		 createAppt();
    		 $("#leftdiv").hide();
    		 $("#rightdiv").hide();
    		 $("#timeslot_div").hide();
    		 $("#popup-message").text("Thankyou! Your Interview Scheduled Successfully.").show();
    		 
    	});
    });
   
    function generateAccessToken(){
    	
    	console.log("Inside function");
    	
    	
					$.ajax({
								url : 'https://developer.setmore.com/api/v1/o/oauth2/token?refreshToken=45d657e9b9o9SxUPscZnCHqElKKVjPLMZW36o2liPAkRT',
								method : 'GET',
								async : false,

								success : function(response) {
									var token = JSON.stringify(response);
									window.accesstoken = response.data.token.access_token;
									console.log(window.accesstoken);
									},
								failure : function(error) {
										console.log("error");
									}
								});
					     }

	function fetchStaff() {

		window.staffCollection = {};

						$.ajax({
									url : 'https://developer.setmore.com/api/v1/bookingapi/staffs',
									method : 'GET',
									beforeSend : function(xhr) {
										xhr.setRequestHeader('Content-Type','application/json');
										xhr.setRequestHeader('Authorization','Bearer ' + window.accesstoken);
									},
									success : function(response) {
										window.staffCollection = response.data.staffs;

										console.log(response);

										var parsed = JSON.stringify(staffCollection);
										console.log(parsed);

										for (var i = 0; i < staffCollection.length; i++) {
											console.log(staffCollection[i]);

											/* $.each(window.staffCollection[i], function(key, value) {
											    if( key == "email_id"){
											    	console.log("Stafff email address" + value);
											    	window.staffEmail = value;
											    	}
											    });
											 */
											$('#mySelect')
													.append($("<option></option>")
																	.attr("value",staffCollection[i].key)
																	.text(staffCollection[i].first_name));
										}

										$('select').on('change',function() {
												var selectedKey = this.value;
												var filterObj = window.staffCollection.filter(function(obj) {
												  return obj.key == selectedKey;
												});
												
												alert("filterobj ::"+filterObj[0].email_id);
												
												window.staffEmail = filterObj[0].email_id;
												console.log("the staff email" + window.staffEmail);

											 
											 generateTimeSlots(window.staffCollection,this.value);
										});
										
										generateTimeSlots(window.staffCollection, staffCollection[0].key);
									},

									failure : function(error) {
										console.log("error");
									}

								});

					}

	function generateTimeSlots(data, staffKey) {
		
		$("#timeslots_ul").html("");
		var month_names 		= 	["01", "02", "03", "04", "05", "06", 
		                    		"07", "08", "09","10", "11", "12"];
		
		
		var today 				= 	new Date();
		var day					= 	today.getDate();
		var month_index	 		= 	today.getMonth();
		var year 				= 	today.getFullYear();
		var ISOFormatDate		=	today.toISOString();
		var cDate	       		=	ISOFormatDate.split("T")[0];
		var currentDate 		= 	cDate.split("-").reverse().join("/");
		window.staffkey = staffKey;
		
		console.log(ISOFormatDate);
		
		var inputdate   	= 	$("#datepicker").val();
		var splitDate 		= 	inputdate.split("/");
		var selectedDate 	= 	Number(splitDate[0]);
		var selectedMonth 	= 	Number(splitDate[1]);
		var selectedYear 	= 	Number(splitDate[2]);
		var inputDateObj 	= 	new Date(selectedYear,selectedMonth-1,selectedDate);
		
		window.formattedinputdate  = inputdate.split("/").reverse().join("-");
		var currentTime         =   today.getHours() + ":" + today.getMinutes();
		
		timeslotsDetails.staff_key = staffKey;
		timeslotsDetails.service_key = "s13281518169157960";
		timeslotsDetails.selected_date = inputdate;
		timeslotsDetails.slot_limit = 30;
			
				console.log(inputdate);
				console.log(timeslotsDetails);

						$.ajax({
									url : 'https://developer.setmore.com/api/v1/bookingapi/slots',
									method : 'POST',
									beforeSend : function(xhr) {
										xhr.setRequestHeader('Content-Type',
												'application/json');
										xhr.setRequestHeader('Authorization',
												'Bearer ' + window.accesstoken);
									},
									data : JSON.stringify(timeslotsDetails),
									success : function(response) {
										console.log(response);
										var slotCollection = response.data.slots;
										console.log(slotCollection);
										
											if(slotCollection.length == 0)
												{
													$("#noslotsmessage").text("No Slots Available!").show();
											
													}else{
														$("#noslotsmessage").text("No Slots Available!").hide();
													}
										
													for (var i = 0; i < slotCollection.length; i++) {
															if(currentDate == inputdate && slotCollection[i]>currentTime){
																console.log(slotCollection[i]);
																	$('#timeslots_ul').append($("<li id = 'timeslot_list'></li>")
																		.attr("value",staffKey)
																		.text(slotCollection[i]));
																	}
													 			
													 			else if (inputDateObj > today){
													 				console.log(slotCollection[i]);
													 				$('#timeslots_ul').append($("<li id = 'timeslot_list'></li>")
																		.attr("value",staffKey)
																		.text(slotCollection[i]));
													 			}
															}
																	$("li").on('click',function() {
																		window.selected_timeinfo = $(this).text();
																		appointmentInformation(selected_timeinfo,data);
																	}); 
									},
									failure : function(error) {
										console.log("error");
										}
								});
						} 
	
	function appointmentInformation(selected_timeinfo,data)
	 {
		var customer_nameinfo = $("#firstname").val();
		var customer_emailinfo = $("#email").val();
		var selected_Dateinfo = $("#datepicker").val();
		var selected_Staffinfo = $( "#mySelect option:selected" ).text();
		console.log(selected_timeinfo);
		console.log(data);
		
		$("#staffName").html(selected_Staffinfo);
		$("#customer_name").html(customer_nameinfo);
		$("#customer_email").html(customer_emailinfo); 
		$("#selected_date").html(selected_Dateinfo);
		$("#selected_time").html(selected_timeinfo);
		
		
		$("#appointmentInformation_div").show();
	}
	
 function createAppt(){
	 
	// staffDetails.email_id = window.staffEmail;
	var selectedstaffEmail = window.staffEmail;
	console.log("create app" + selectedstaffEmail);
	 var startTime1 = window.formattedinputdate+"T"+window.selected_timeinfo+":20.434Z";
	//Calculate End time
	 var count = 0;
	 var startTime = window.selected_timeinfo;
	 var serviceDurationTime = 30;
	 var totalMinutes = parseInt(serviceDurationTime) + parseInt(startTime.substring(3,5));
	 var hours = "";
	 var minutes = "";
	 		if(totalMinutes > 60){
	 			count++;
	 			minutes = totalMinutes % 60;
	 		} else {
	 			minutes = totalMinutes;
	 		}
	 hours = parseInt(startTime.substring(0,2)) + count;
	 var calculateEndTime = hours + ":" + minutes;
	 console.log(calculateEndTime);
	 var endTime = window.formattedinputdate+"T"+calculateEndTime+":20.434Z";
	
	 appointmentDetails.customer_key = window.customerKey;
	 appointmentDetails.staff_key = window.staffkey;
	 appointmentDetails.service_key = "s13281518169157960";
	 appointmentDetails.start_time = startTime1;
	 appointmentDetails.end_time = endTime;
	 $.ajax({
					url : 'https://developer.setmore.com/api/v1/bookingapi/appointment/create',
					method : 'POST',
					beforeSend : function(xhr) {
						xhr.setRequestHeader('Content-Type',
							'application/json');
						xhr.setRequestHeader('Authorization',
							'Bearer ' + window.accesstoken);
				},
					data : JSON.stringify(appointmentDetails),
					success : function(response) {
						console.log(response);
				
											$.ajax({
													url 	: '/sendstaffemail',
													method 	: 'POST',
													dataType: 'json',
													data:{"data":'selectedstaffEmail'},
													success : function(success) {
														console.log("Entered in to staff");
														},
													failure : function(error) {
														console.log("error");
														console.log(response);
														}	
												});
			},
			failure : function(error) {
				console.log("error");
				}
		});
	 
 }
	
 
 
	 function createCustomer() {
		console.log(customerDetails.first_name);
		console.log(customerDetails.email_id);
    $("#timeslot_div").show();
						$.ajax({
									url : 'https://developer.setmore.com/api/v1/bookingapi/customer/create',
									method : 'POST',
									async : false,
									beforeSend : function(xhr) {
										xhr.setRequestHeader('Content-Type','application/json');
										xhr.setRequestHeader('Authorization','Bearer ' + window.accesstoken);

									},
									data : JSON.stringify(customerDetails),
									success : function(response) {
										console.log(response); 
										var customerData = response.data.customer;
										console.log(customerData);
										 $.each(customerData, function(key, value) {
										    if( key == "key"){
										    	console.log(value);
										    	 window.customerKey = value;
										    	 } 
										    });
										    	$.ajax({
															url 	: '/sendcustomeremail',
															method 	: 'POST',
															dataType: 'json',
															data: "data=" + JSON.stringify(customerDetails),
															success : function(success) {
																console.log("Entered in to customer");
																
															},
															failure : function(error) {
																console.log("error");
															}	
																	});
									},

									failure : function(error) {
										console.log("error");
									}
								});
					} 
	
	
				</script>
</body>
</html>
