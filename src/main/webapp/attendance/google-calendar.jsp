
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='../css/main.css' rel='stylesheet' />
<script src='../js/main.js'></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						var calendarEl = document.getElementById('calendar');

						var calendar = new FullCalendar.Calendar(
								calendarEl,
								{

									headerToolbar : {
										left : 'prev,next today',
										center : 'title',
										right : 'dayGridMonth,listYear'
									},
									 locale:'ko',

									displayEventTime : false, // don't show the time column in list view

									// THIS KEY WON'T WORK IN PRODUCTION!!!
									// To make your own Google API key, follow the directions here:
									// http://fullcalendar.io/docs/google_calendar/
									googleCalendarApiKey : 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE',

									eventSources : [
									// 대한민국의 공휴일
									{
										googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
										className : "koHolidays",
										color : "#00ff00",
										textColor : "#000000"
									} ],

									eventClick : function(arg) {
										// opens events in a popup window
										window.open(arg.event.url,
												'google-calendar-event',
												'width=700,height=600');

										arg.jsEvent.preventDefault() // don't navigate in main tab
									},

									loading : function(bool) {
										document.getElementById('loading').style.display = bool ? 'block'
												: 'none';
									}

								});

						calendar.render();
					});

	
</script>

<script>
function startTime() {
	var now = new Date();
	console.log(now);
	console.dir(now);
	$("input[value='출근']").on("click", function() {
		console.log("출근");
	})

	var year = now.getFullYear();
	console.log(year);

	var startTime = now.getFullYear() + "년" + (now.getMonth() + 1) + "월"
			+ now.getDate() + "일" + now.getHours() + "시" + now.getMinutes()
			+ "분" + now.getSeconds() + "초";
	console.log(startTime);

	var timeEle = document.getElementById("span");
	timeEle.value = startTime;
	$("#span").html(now.getHours() + ":" + now.getMinutes());

	// 추가된 부분
	var startTimeDiv = document.getElementById("start-time");
	startTimeDiv.innerHTML = now.getMonth() + 1 + "월 " + now.getDate()
			+ "일 출근: " + now.getHours() + ":" + now.getMinutes();
}

function endTime() {
	var now = new Date();
	$("input[value='퇴근']").on("click", function() {
		console.log("퇴근");
	})

	var year = now.getFullYear(); // 연도를 출력
	console.log(year);

	var endTime = now.getFullYear() + "년" + (now.getMonth() + 1) + "월"
			+ now.getDate() + "일" + now.getHours() + "시" + now.getMinutes()
			+ "분" + now.getSeconds() + "초";
	console.log(endTime);

	var timeEle = document.getElementById("endTime");
	timeEle.value = startTime;
	$("#endTime").html(now.getHours() + ":" + now.getMinutes());
}
</script>
<style>
body {
	margin: 100px 100px 100px 100px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#loading {
	display: none;
	position: absolute;
	top: 10px;
	right: 10px;
}

#calendar {
	max-width: 900px;
	margin: 50px 100px;
}
</style>
</head>
<body>

	<div id='loading'>loading...</div>

	<div id='calendar'></div>

	<div id="span"></div>
	<div id="endTime">퇴근시간</div>
	<div id="start-time"></div>
	<input type="button" value="출근" onclick="startTime();" />
	<input type="button" value="퇴근" onclick="endTime();" />

</body>
</html>
