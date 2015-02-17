HTMLWidgets.widget({

  name: 'trailr',

  type: 'output',

  initialize: function(el, width, height) {

    var svg = d3.select(el).append("svg")
      .style("width", width)
      .style("height", height)

    return { svg: svg }

  },

  renderValue: function(el, x, instance) {

    var trail = d3.layout.trail().coordType('xy')

    var pathdata = trail
      .data(HTMLWidgets.dataframeToD3(x.data))
      .layout()

    paths = instance.svg.selectAll("line").data(pathdata)

    paths.enter()
      .append("line")
      .style("stroke-width",3)
      .style("stroke","black")
      .transition()
      .delay(function(d,i) {return i*100})
      .attr("x0",function(d) {
        return  d.x0
      })
      .attr("x1",function(d) {
        return d.x1
      })
      .attr("y1",function(d) {
        return d.y1
      })
      .attr("y2",function(d) {
        return d.y2
      })
      .attr("x2",function(d) {
        return d.x2
      })
      .style("opacity",.5)
      .transition()
      .duration(5000)
      .style("opacity",0)
      .remove()
  },

  resize: function(el, width, height, instance) {

  }

});
