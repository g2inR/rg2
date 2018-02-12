HTMLWidgets.widget({

  name: 'rg2',

  type: 'output',

  factory: function(el, width, height) {
    G2.track(false);

    var chart;

    return {

      renderValue: function(params) {

        var widget = document.getElementById(el.id)
        while (widget.firstChild) {
        widget.removeChild(widget.firstChild);
        }



        if (Object.keys(params).indexOf("facet") > -1) {
          var facet = params.facet
          delete params.facet

        }

        params.forceFit = params.forceFit ? params.forceFit: true;
        params.container = params.container ? params.container : el.id;
        params.width = params.width ? params.width : width;
        params.height = params.height ? params.height : height;
        params.data = HTMLWidgets.dataframeToD3(params.data);


        console.log(params)
        chart = new G2.Chart(params);

        if (typeof(facet) != "undefined") {


         if (Object.keys(facet.opts).indexOf('eachView') == -1){

           facet.opts.eachView = function(view){
             facet.geoms.forEach(function(d){
                var v = view[d.type]();
                Object.keys(d)
                  .filter(function(i){ return i != "type"})
                  .forEach(function(i){
                    var args = d[i];
                    if(typeof args == "object"){
                     args = Object.values(args)
                    }
                    else if(!Array.isArray(args)){
                      args = [args]
                    }
                    return v[i].apply(v, args);
                  })
              })
            }
          }
          console.log(facet)
          chart['facet'](facet.type, facet.opts);
        }



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

      }

    };
  }
});
