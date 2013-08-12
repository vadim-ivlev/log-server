class @Drops

    svg = null
    desk = null
    outerContainer = null

    z = d3.scale.category20c()
    i = 0

    lin =(x)->
        Math.sqrt(x)+ Math.random() * x * 0.1

    particle = (logRecord) ->

        w=outerContainer.width()
        h=outerContainer.height()

        svg.append("svg:circle")
        .attr("cx", w * Math.random())
        .attr("cy", h * Math.random())
        .attr("r", 1)
        .style("fill", "transparent")
#        .style("fill-opacity", 0.1)
        .style("stroke", "white")
#        .style("stroke", z(++i))
        .style("stroke-width", 1)
        .transition()
        .duration(1000)
        .ease(Math.sqrt)
#        .attr("cx", w * Math.random())
#        .attr("cy", h * Math.random())
        .attr("r", 10+50*Math.random())
        .style("stroke-opacity", 1e-6)
#        .style("fill-opacity", 1e-6)
        .remove()


    clear: () ->
        desk.html ""

    write: (text) ->
        desk.html(desk.html() + text)

    show: (log, startTime = 10, period = 0.5)->
        if not log then return
        records = log.getPastRecords(startTime, period)
        for rec in records
            particle(rec)


    constructor: (containerSelector)->
        outerContainer=$(containerSelector)
        svg = d3.select("#dropSvg")