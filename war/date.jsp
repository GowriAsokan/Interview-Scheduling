<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Hello App Engine</title>
</head>

<body>


<p> This is a date picker project! </p>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
$( "#datepicker" ).datepicker();

} );




/* var fallbackPicker = document.querySelector('.fallbackTimePicker');
var fallbackLabel = document.querySelector('.fallbackLabel');

var hourSelect = document.querySelector('#hour');
var minuteSelect = document.querySelector('#minute');

// hide fallback initially
fallbackPicker.style.display = 'none';
fallbackLabel.style.display = 'none';

// test whether a new date input falls back to a text input or not
var test = document.createElement('input');
test.type = 'time';
// if it does, run the code inside the if() {} block
if(test.type === 'text') {
// hide the native picker and show the fallback

fallbackPicker.style.display = 'block';
fallbackLabel.style.display = 'block';

// populate the hours and minutes dynamically
populateHours();
populateMinutes(); */
/* }

function populateHours() {
// populate the hours <select> with the 6 open hours of the day
for(var i = 12; i <= 18; i++) {
var option = document.createElement('option');
option.textContent = i;
hourSelect.appendChild(option);
}
}

function populateMinutes() {
// populate the minutes <select> with the 60 hours of each minute
for(var i = 0; i <= 59; i++) {
var option = document.createElement('option');
option.textContent = (i < 10) ? ("0" + i) : i;
minuteSelect.appendChild(option);
}
}

// make it so that if the hour is 18, the minutes value is set to 00
// ? you can't select times past 18:00
function setMinutesToZero() {
if(hourSelect.value === '18') {
minuteSelect.value = '00';
} */
/* }

hourSelect.onchange = setMinutesToZero;
minuteSelect.onchange = setMinutesToZero;
 */
</script>
</head>
<body>

<form method = "POST" action="datepicker">

<p>Date: <input type="text" id="datepicker" name="datepicker"></p>

<input type = "submit" value="Submit">
</form>











function generateTimeSlots(data, staffKey) {
		
		$("#timeslotsid").html("");
		var month_names 		= 	["01", "02", "03", "04", "05", "06", 
		                    		"07", "08", "09","10", "11", "12"];
		var today 				= 	new Date();
		var day					= 	today.getDate();
		var month_index	 		= 	today.getMonth();
		var year 				= 	today.getFullYear();
		var currentDate 		= 	day + "/" + month_names[month_index] + "/" + year;
		var currentTime         =   today.getHours() + ":" + today.getMinutes();
		var  inputdate 		= 	$("#datepicker").val();
		
		console.log(day + "/" + month_names[month_index] + "/" + year);
	
			timeslotsDetails.staff_key = staffKey;
			timeslotsDetails.service_key = "s13281518169157960";
			timeslotsDetails.selected_date = inputdate;
			timeslotsDetails.slot_limit = 90;
			
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
										
										for (var i = 0; i < slotCollection.length; i++) {
											
											if(currentDate == inputdate && slotCollection[i]>currentTime){
												// alert("inside true");
													$('#timeslotsid').append($("<li id = 'timeslot_list'></li>")
														.attr("value",staffKey)
														.text(slotCollection[i]));
															}
													 else if(currentDate > inputdate){
														$('#timeslotsid').append($("<li id = 'timeslot_list'></li>")
															.attr("value",staffKey)
															.text(slotCollection[i]));
															}	else {
																alert("no slots");
																
															} 
											} 
										
										
									},
									failure : function(error) {
										console.log("error");
									}
								});
					}





































<!-- <form>

<p class="fallbackLabel">Choose an appointment time (opening hours 12:00 to 18:00):</p>
<div class="fallbackTimePicker">
<div>
<span>
<label for="hour">Hour:</label>
<select id="hour" name="hour">
</select>
</span>
<span>
<label for="minute">Minute:</label>
<select id="minute" name="minute">
</select>
</span>
</div>
</div>
</form> -->
</body>
</html>