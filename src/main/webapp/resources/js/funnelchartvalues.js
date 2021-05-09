$.ajax({
	type : 'GET',
	url : 'rest/opportunity/getAllOpportunityStatus?emailId='+$('#userEmail').val(),
	dataType : "json",
	success : function(data) {
		AmCharts.makeChart("chartdiv", {
			"type" : "serial",
			"dataProvider" : data,
			"valueAxes" : [ {
				"axisAlpha" : 0,
				"labelsEnabled" : false,
				"gridAlpha" : 0
			} ],
			"graphs" : [ {
				"id" : "fromGraph",
				"lineAlpha" : 0,
				"showBalloon" : false,
				"valueField" : "value2",
				"fillAlphas" : 0
			}, {
				"fillAlphas" : 1,
				"fillToGraph" : "fromGraph",
				"lineAlpha" : 0,
				"lineColorField" : "color",
				"fillColorsField" : "color",
				"showBalloon" : false,
				"valueField" : "value"
			} ],
			"categoryField" : "category",
			"categoryAxis" : {
				"startOnAxis" : true,
				"axisAlpha" : 0.1,
				"gridPosition" : "left",
				"gridAlpha" : 0.1,
				"tickLength" : 10,
				"tickPosition" : "start",
				"showLastLabel" : false
			}
		});
	},
	error : function(e) {
		alert(e.responseText);
	}
});

/*
 * [{ 'category' : 'S0' , 'value' : 75897, 'value2' : -75897, 'color' :
 * '#a8c81f'},{ 'category' : 'S1' , 'value' : 10769, 'value2' : -10769, 'color' :
 * '#f08256'},{ 'category' : 'S2' , 'value' : 2051, 'value2' : -2051, 'color' :
 * '#4388a5'},{ 'category' : 'S3' , 'value' : 5128, 'value2' : -5128, 'color' :
 * '#ead373'},{ 'category' : 'S4' , 'value' : 2051, 'value2' : -2051, 'color' :
 * '#22ad71'},{ 'category' : 'S5' , 'value' : 0, 'value2' : -0, 'color' :
 * '#8f447e'},{ 'category' : 'S6' , 'value' : 512, 'value2' : -512, 'color' :
 * '#f08200'},{ 'category' : 'S7' , 'value' : 2564, 'value2' : -2564, 'color' :
 * '#200256'}],
 * 
 * var chart = AmCharts.makeChart("chartdiv", { "type": "serial",
 * "dataProvider": statusData, "valueAxes": [{ "axisAlpha": 0, "labelsEnabled":
 * false, "gridAlpha": 0 }], "graphs": [{ "id": "fromGraph", "lineAlpha": 0,
 * "showBalloon": false, "valueField": "value2", "fillAlphas": 0 }, {
 * "fillAlphas": 1, "fillToGraph": "fromGraph", "lineAlpha": 0,
 * "lineColorField": "color", "fillColorsField": "color", "showBalloon": false,
 * "valueField": "value" }], "categoryField": "category", "categoryAxis": {
 * "startOnAxis": true, "axisAlpha": 0.1, "gridPosition": "left", "gridAlpha":
 * 0.1, "tickLength": 10, "tickPosition": "start", "showLastLabel": false } });
 */