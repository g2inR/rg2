
HTMLWidgets.widget({

  name: 'rg2',

  type: 'output',

  factory: function(el, width, height) {

    return {

      renderValue: function(params) {
        console.log(params)

        //to change later
        const chart = new G2.Chart({
          container: el,
          forceFit: true,
          height: window.innerHeight
        });
        
        //to do: strategy ->
        //params: only non-empty arguments
        //get object keys from params (source, scales, geoms, etc...)
        //for each key pass arguments to G2
  
        if (Object.keys(params).indexOf('transform') > -1){
            const ds = new DataSet();
            const dv = ds.createView().source(params.source);
            dv.transform(params.transform);
            chart.source(dv)
        } else{
            //source
            chart.source(params.source)
        }

        //scales
        params.scales.forEach(function(d){
            console.log(d.type)
            console.log(d.opts)
          return chart['scale'](d.type, d.opts) 
        }) 

        //geoms
        params.geom.forEach(function(d){
          c = chart[d.type]() 
          Object.keys(d)
            .filter(function(i){ return i != "type"})
            .forEach(function(i){
              c[i].apply(c, d[i]);
          })
        })
        chart.render();

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
