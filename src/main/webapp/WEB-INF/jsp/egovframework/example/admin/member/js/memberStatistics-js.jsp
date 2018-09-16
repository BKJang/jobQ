<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Javascript files -->

<!-- Morris JS -->
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

<!-- Scripts for this page -->
<script type="text/javascript">
	var date = new Date();
	var today = {
		year   : date.getFullYear(),
		month  : date.getMonth() + 1,
		date   : date.getDate(),
		getToday : function(m){
			var tempMonth = this.month;	// 실제 this.month가 값이 변하면 큰일이다.
			var tempYear = this.year;	// 실제 this.year가 값이 변하면 큰일이다.
			
			tempMonth = this.month - m;
	
			if(tempMonth <= 0){
				tempMonth = 12 + tempMonth;
				
				return (tempYear - 1) + "-" + tempMonth;
			}
			
			return this.year + '-' + (tempMonth < 10 ? '0' + tempMonth : tempMonth);
		}
	};
	
	var charts = {
		showBarChart : {},
		showDonutChart : {},
		showLineChart : {},
		showAreaChart : {},
		barChart : {},
		donutChart : {},
		lineChart : {},
		areaChart : {}
	};

	$(document).ready(function() {
		var ageChartDataSet = {},
		sexChartDataSet = {},
		employChartDataSet = {},
		memberChartDataSet = {};
		
		$.ajax({
			type    : 'GET',
			url     : '<c:url value="/admin/member/statistics/chart/list" />',
			success : function(result){
				ageChartDataSet =  result[0];
				memberChartDataSet = result[1];
				sexChartDataSet = result[2];
				
				charts.showLineChart();
				charts.showDonutChart(ageChartDataSet);
				charts.showBarChart(sexChartDataSet);
				charts.showAreaChart(memberChartDataSet);
			}
		});
		
		// 이걸 여기다 하면 ajax비동기 때문에 밑에 애들이 먼저 실행된다.
		/* charts.showLineChart();
		charts.showDonutChart(ageChartDataSet);
		charts.showBarChart();
		charts.showAreaChart(); */
	});

	$(window).resize(function() {
		charts.barChart.redraw();
		charts.lineChart.redraw();
		charts.donutChart.redraw();
		charts.areaChart.redraw();
	});

	/* Line Chart */
	charts.showLineChart = function() {
		this.lineChart = Morris.Line({
			element : 'lineChart',
			data : [ {
				year  : today.getToday(4),
				value : 423
			}, {
				year  : today.getToday(3),
				value : 712
			}, {
				year  : today.getToday(2),
				value : 328
			}, {
				year  : today.getToday(1),
				value : 1023
			}, {
				year  : today.getToday(0),
				value : 674
			} ],
			xkey   : 'year',
			ykeys  : [ 'value' ],
			labels : [ '총 구직자수' ],
			hideHover : 'true'	// Hover를 할 때만, tooltip이 보이게 한다. 기본값이 always라서 hover를 한번 하면 tooltip이 사라지지 않고 계속 남아있다.
		});
	};

	/* Line Chart End */

	/* Donut Chart */

	charts.showDonutChart = function(ageChartDataSet) {
		this.donutChart = Morris.Donut({
			element : 'donutChart',
			data : [ {
				label : "20대",
				value : ageChartDataSet.twenty
			}, {
				label : "30대",
				value : ageChartDataSet.thirty
			}, {
				label : "40대",
				value : ageChartDataSet.forty
			}, {
				label : "50대",
				value : ageChartDataSet.fifty
			}, {
				label : "60대 이상",
				value : ageChartDataSet.sixty
			}, ],
			formatter : function(x) {
				return x + "%";
			}
		});
	};

	/* Donut Chart End */

	/* BarChart */

	charts.showBarChart = function(sexChartDataSet) {
		var sexDataSet = [{
		    date  : today.getToday(10),
			women : 307,
			men   : 298
		}, {
			date  : today.getToday(9),
			women : 190,
			men   : 221
		}, {
			date  : today.getToday(8),
			women : 872,
			men   : 304
		}, {
			date  : today.getToday(7),
			women : 1028,
			men   : 1022
		}, {
			date  : today.getToday(6),
			women : 392,
			men   : 702
		}, {
			date  : today.getToday(5),
			women : 304,
			men   : 293
		}, {
			date  : today.getToday(4),
			women : 302,
			men   : 452
		}, {
			date  : today.getToday(3),
			women : 468,
			men   : 762
		}, {
			date  : today.getToday(2),
			women : 506,
			men   : 203
		}, {
			date  : today.getToday(1),
			women : 279,
			men   : 408
		}, {
			date  : today.getToday(0),
			women : 305,
			men   : 297
		}];
		
		$.each(sexDataSet, function(index, element){
			element.women = sexChartDataSet['w-' + element.date];
			element.men = sexChartDataSet['m-' + element.date];
		});
		
		this.barChart = Morris.Bar({
			element   : 'barChart',
			data      : sexDataSet,
			xkey      : 'date',
			ykeys     : [ 'women', 'men' ],
			labels    : [ '여성', '남성' ],
			lineWidth : '5px',
			hideHover : 'true',
			resize : true,
			redraw : true
		});
	};
	/* BarChart End */

	/* AreaChart */

	charts.showAreaChart = function(memberChartDataSet) {
		var memberTypeDataSet = [{
			date    : today.getToday(10),
			'일반 회원' : 307,
			'기업 회원' : 298
		}, {
			date    : today.getToday(9),
			'일반 회원' : 190,
			'기업 회원' : 221
		}, {
			date    : today.getToday(8),
			'일반 회원' : 872,
			'기업 회원' : 304
		}, {
			date    : today.getToday(7),
			'일반 회원' : 1028,
			'기업 회원' : 1022
		}, {
			date    : today.getToday(6),
			'일반 회원' : 392,
			'기업 회원' : 702
		}, {
			date    : today.getToday(5),
			'일반 회원' : 304,
			'기업 회원' : 293
		}, {
			date    : today.getToday(4),
			'일반 회원' : 302,
			'기업 회원' : 452
		}, {
			date    : today.getToday(3),
			'일반 회원' : 468,
			'기업 회원' : 762
		}, {
			date    : today.getToday(2),
			'일반 회원' : 506,
			'기업 회원' : 203
		}, {
			date    : today.getToday(1),
			'일반 회원' : 279,
			'기업 회원' : 408
		}, {
			date     : today.getToday(0),
			'일반 회원' : 305,
			'기업 회원' : 297
		}];
		
		$.each(memberTypeDataSet, function(index, element){
			element['일반 회원'] = memberChartDataSet['g-' + element.date];
			element['기업 회원'] = memberChartDataSet['c-' + element.date];
		});
		
		this.areaChart = Morris.Area({
			element   : 'areaChart',
			data      : memberTypeDataSet,
			xkey      : 'date',
			ykeys     : [ '일반 회원', '기업 회원' ],
			labels    : [ '일반 회원', '기업 회원' ],
			lineWidth : '5px',
			hideHover : 'true',
			behaveLikeLine : true,	// 영역을 서로 겹쳐서도 출력이 되게 한다. 기본값은 false
			resize    : true,
			redraw    : true,
		});
	};

	/* AreaChart End */
</script>