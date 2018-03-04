HTMLWidgets.widget({

  name: 'rg2',
  type: 'output',

  factory: function(el, width, height) {
    G2.track(false);
    var chart;
    return {

      renderValue: function(params) {
        //clear existing elements when in shiny
        var widget = document.getElementById(el.id)
        while (widget.firstChild) {
          widget.removeChild(widget.firstChild);
        }

        params.container = params.container ? params.container : el.id;
        params.width = params.width ? params.width : width;
        params.height = params.height ? params.height : height;
        params.data = HTMLWidgets.dataframeToD3(params.data);

        chart = new G2.Chart(params)
        params.g2Script(chart, params.data);
        chart.render();

       //to do: set as optional
        const brush = new Brush({
          canvas : chart.get('canvas'),
          chart: chart,
          type: 'X',
        });

       chart.on('plotdblclick', function(){
        chart.get('options').filters = {};
        chart.repaint();
      });

      },

      resize: function(width, height) {
//todo
      }

    };
  }
});
