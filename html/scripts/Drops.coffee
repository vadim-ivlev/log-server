class @Drops

    svg = null
    desk = null
    outerContainer = null

    z = d3.scale.category20c()
    i = 0

    lin =(x)->
        x

    particle = (logRecord) ->

        w=outerContainer.width()
        h=outerContainer.height()

        xx = w * Math.random()
        rand=Math.random()
        yy = h * rand * 0.1 +h/2


        svg.append("svg:circle")
        .attr("cx", xx)
        .attr("cy", yy-200)
        .attr("r", 2)
        .style("fill", "white")
        .style("fill-opacity", 0.1)
#        .style("stroke", "white")
        .transition()
        .duration(500)
        .ease("bounce")
        .attr("cy", yy)
        .style("fill-opacity", 0.1+rand)
        .remove()
        .each "end", ->
            r=10+80*rand
            svg.append("svg:ellipse")
            .attr("cx", xx)
            .attr("cy", yy)
            .attr("rx", 1)
            .attr("ry", 1)
            .style("fill", "transparent")
            .style("fill-opacity", 1)
            .style("stroke", "white")
            .style("stroke-opacity", 0.1+rand)
    #        .style("stroke", z(++i))
            .style("stroke-width", 1)
            .transition()
            .duration(1000)
#            .ease(Math.sqrt)
            .ease("linear")
    #        .attr("cx", w * Math.random())
    #        .attr("cy", h * Math.random())
            .attr("rx", r)
            .attr("ry", r*0.2)
            .style("stroke-width", 1+2*rand)
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