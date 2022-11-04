am5.ready(function() {

    // Create root element
    // https://www.amcharts.com/docs/v5/getting-started/#Root_element
    var root = am5.Root.new("chartdiv");
    
    
    // Set themes
    // https://www.amcharts.com/docs/v5/concepts/themes/
    root.setThemes([
      am5themes_Animated.new(root)
    ]);
    
    
    // Create chart
    // https://www.amcharts.com/docs/v5/charts/xy-chart/
    var chart = root.container.children.push(am5xy.XYChart.new(root, {
      panX: true,
      panY: true,
      wheelX: "panX",
      wheelY: "zoomX",
      pinchZoomX:true,
	  layout: root.verticalLayout
    }));
    
    
    // Add cursor
    // https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
    var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {
      behavior: "none"
    }));
    cursor.lineY.set("visible", false);
    
    function generateDatas(count) {
      var data = [];
      for (var i = 1; i <= count; i+=5) {
        if(i==1){
            data.push({category: i, value: 35000});
            i = 0;
        }
        else{
            data.push({category:i, value:35000/i});
        }
      }
      return data;
    }
    
    
    // Create axes
    // https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
    var xAxis = chart.xAxes.push(am5xy.ValueAxis.new(root, {
		renderer: am5xy.AxisRendererX.new(root, {}),
		tooltip: am5.Tooltip.new(root, {})
    }));
    
    var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
		renderer: am5xy.AxisRendererY.new(root, {})
    }));
    
	
    
    // Add series
    // https://www.amcharts.com/docs/v5/charts/xy-chart/series/
    var series = chart.series.push(am5xy.LineSeries.new(root, {
      name: "Score à obtenir par bataille",
      xAxis: xAxis,
      yAxis: yAxis,
      valueYField: "value",
      valueXField: "category",
      tooltip: am5.Tooltip.new(root, {
        labelText: "{valueY}"
      })
    }));
    
    
    // Add scrollbar
    // https://www.amcharts.com/docs/v5/charts/xy-chart/scrollbars/
    chart.set("scrollbarX", am5.Scrollbar.new(root, {
      orientation: "horizontal"
    }));
    
    
    // Set data
    var data = generateDatas(200);
    series.data.setAll(data);
	
	var legend = chart.children.push(am5.Legend.new(root, {}));
	legend.data.setAll(chart.series.values);
    
    
    // Make stuff animate on load
    // https://www.amcharts.com/docs/v5/concepts/animations/
    series.appear(1000);
    chart.appear(1000, 100);
    
    }); // end am5.ready()