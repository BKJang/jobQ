<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Javascript files -->

<!-- jQuery Flot -->
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="/sample/admin/js/excanvas.min.js"></script><![endif]-->
<script src="<c:url value="/admin/js/excanvas.min.js" />" ></script>
<script src="<c:url value="/admin/js/jquery.flot.js" />" ></script>
<script src="<c:url value="/admin/js/jquery.flot.time.js" />" ></script>
<script src="<c:url value="/admin/js/jquery.flot.resize.js" />" ></script>

<!-- Easy Pie Chart -->
<script src="<c:url value="/admin/js/jquery.easypiechart.min.js" />"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$(".easy-pie-chart-1").easyPieChart({
			barColor:"#a90329",
			trackColor:"#f2f2f2",
			scaleColor:false,
			lineCap:'butt',
			lineWidth:10,
			size:100,
			animate:1500,
			onStart:function(from, to, percent){
				// this를 console.dir하면 el이라는 프로퍼티가 있는데, 거기에 easyPieChart가  들어있다.
				$(this.el).find('span').text(to);
			}
		});
		
		$(".easy-pie-chart-2").easyPieChart({
			barColor:"#71843f",
			trackColor:"#f2f2f2",
			scaleColor:false,
			lineCap:'butt',
			lineWidth:10,
			size:100,
			animate:1800,
			onStart:function(from, to, percent){
				$(this.el).find('span').text(to);
			}
		});
		
		$(".easy-pie-chart-3").easyPieChart({
			barColor:"#57889c",
			trackColor:"#f2f2f2",
			scaleColor:false,
			lineCap:'butt',
			lineWidth:10,
			size:100,
			animate:1200,
			onStart:function(from, to, percent){
				$(this.el).find('span').text(to);
			}
		});
		
		$(".easy-pie-chart-4").easyPieChart({
			barColor:"#404040",
			trackColor:"#f2f2f2",
			scaleColor:false,
			lineCap:'butt',
			lineWidth:10,
			size:100,
			animate:2000,
			onStart:function(from, to, percent){
				$(this.el).find('span').text(to);
			}
		});
	})
	
	/* Easy Pie Chart End */
				
	/* Bar Chart starts */
	
	$(function () {
			var date = new Date(),
				tooltip = {previousIndex:0, previousLabel:""},
				barChart = {
					$chart:$('#line-chart'),
					members:{
							employDates:[],
							resumeDates:[]
					},
					dataSet:[],
					options:{
						series: {
							lines: { show: true, steps: false },
						},
						grid: {
							borderWidth: 2, hoverable: true, color: "#777", backgroundColor:{colors:["#EDF5FF", "#ffffff"]}
						},
						xaxis:{
							mode     : "time",
							tickSize : [1, "day"],
							axisLabel: "Date",
							color    : "black"
						}
				}
			};
			
			var dateParser = function(date){
				var dateArr = date.split("-");
				
				return new Date(dateArr[0], dateArr[1], dateArr[2]).getTime();
			}
			
			<c:forEach var="resumeDate" items="${resumeDates}">
				console.log(dateParser('${resumeDate}'));
				barChart.members.resumeDates.push(['${resumeDate}', parseInt(Math.random() * 4500)]);
			</c:forEach>
			
			<c:forEach var="employDate" items="${employDates}">
				barChart.members.employDates.push(['${employDate}', parseInt(Math.random() * 2000)]);
			</c:forEach>
			
			for (var i = 0; i <= 7; i += 1){
				/* console.log(gd(date.getFullYear(), date.getMonth(), date.getDate() - i));
				console.dir(barChart.members.resumeDates); */
			}
				// barChart.members.generalMember.push([gd(date.getFullYear(), date.getMonth(), date.getDate() - i), parseInt(Math.random() * 4500)]);

			/* for (var i = 0; i <= 7; i += 1){
				
			} */
				// barChart.members.corporateMember.push([gd(date.getFullYear(), date.getMonth(), date.getDate() - i), parseInt(Math.random() * 2000)]);

			function gd(year, month, day){return new Date(year, month, day).getTime()};
			
			barChart.dataSet = [
			    {
			    	label:'이력서',
			    	data:barChart.members.resumeDates,
			    	color:"#0062FF",
			    	points:{symbol:"circle", fillColor:"#0062FF", show:true},
			    },
			    {
			    	label:'채용 공고', 
			    	data:barChart.members.employDates,
			    	color:"#FF0000",
			    	points:{symbol:"circle", fillColor:"#FF0000", show:true},
			    }
			]
			
			barChart.plotWithOptions = function() {
				$.plot(barChart.$chart, barChart.dataSet, barChart.options);
			}

			barChart.plotWithOptions();
			
			/* barChart Tooltip */
			
			tooltip = function(x, y, clr, contents){
				$('<div id="tooltip">' + contents + '</div>').css( {
					position: 'absolute',
					display: 'none',
					top: y + 5,
					width: 150,
					left: x + 5,
					border: '1px solid ' + clr,
					padding: '2px 8px',
					color: '#000',
					'background-color': '#fff',
					opacity: 0.9
				}).appendTo("body").fadeIn(200);
			}
			
			
			barChart.$chart.bind("plothover", function(event, pos, item){
				if(item){
					if(tooltip.previousIndex != item.dataIndex || tooltip.previousLabel != item.series.label){
						tooltip.previousIndex = item.dataIndex;		// 데이터의 인덱스 - 뒤에서부터 앞으로 0, 1, 2 ,3 ...
						tooltip.previouseLabel = item.series.label;	// 제목을 의미한다. ex) 채용 공고, 이력서 
						$('#tooltip').remove();						// 그전에 만들어진 툴팁을 현재의 hover된 값과 다르다면 툴팁을 지운다.
						
						// 자바스크립트 시간 구하는 방법
						var date = new Date(item.datapoint[0]);			// datapoint[0]은 x축의 값 => 시간값
						var year = date.getFullYear();					// 
						var month = date.getMonth() + 1;
						var day = date.getDate();
						
						var color = item.series.color;			// 각 선의 칼라
						var memberNumbers = item.datapoint[1];	// datapoint[1]은 y축의 값	=> 개수
						
						tooltip(item.pageX, item.pageY, color, "<strong>" + item.series.label + "</strong><br>" + year + "." + month + "." + day + " - <strong>" + memberNumbers + "개</strong>");
					}
				}else{
					$('#tooltip').remove();
					tooltip.previousIndex = 0;
					tooltip.previousLabel = "";
				}
			})
			
		});

		/* Bar chart ends */
		
		function goList(){
			var viewMore = $('li.active[role=presentation]').children().attr('aria-controls');
			
			if(viewMore == 'member'){
				location.href = "<c:url value='/admin/member/manage/main' />";
			}else if(viewMore == 'resume'){
				location.href = "<c:url value='/admin/resume/main' />";
			}else if(viewMore == 'employ'){
				location.href = "<c:url value='/admin/employ/main' />";
			}else if(viewMore == 'apply-and-offer'){
				location.href = "<c:url value='/admin/applyandoffer/apply/main' />";
			}else if(viewMore == 'board'){
				location.href = "<c:url value='/admin/board/jobstory/main' />";
			}else if(viewMore == 'inquire'){
				location.href = "<c:url value='/admin/inquire/qna/main' />";
			}
		};
		</script>