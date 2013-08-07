class Visualizer0
  area=null
  out=null
  timer=null
  @myLog=null

  clear = -> area?.html ""
  write = (text) ->
    area.html(area.html() + text)


  stop:()->
    clearInterval timer
    clear()

  start:()->
    @stop()
    getSummary()
    timer=setInterval getSummary, 5000

  updateArea=->
    clear()
    write @myLog.getSummary()
    write """
      <pre>
      #{myLog.getCurrentTime()} ************************
      #{myLog.getPastRecords(10,0.5).join "\n"}
      #{myLog.getCurrentTime()} ************************
      --------------------------
      {myLog.getShortLog()}
      </pre>
      """

  getSummary=->
    @myLog=new ApacheLog()
    $.get Common.FULL_URL , (txt)=>
      @myLog.addText txt
      updateArea()

  init:->
    clearInterval timer
    @myLog=new ApacheLog()
    out=$("#out2")
    out.html("")
    area=$("<div style='position:relative; left:0px; top:0px;  width:550px; height:600px; border:1px solid silver; color:black; overflow-y:hidden;'>mmm<div>")
    out.append(area)
