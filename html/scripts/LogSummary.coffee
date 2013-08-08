class @LogSummary
  area=null
  out=null

  clear :() -> area?.html ""


  write : (text) ->
    area.html(area.html() + text)


  show:(log)->
    @clear()
    try
      @write """
        <pre>
        Current Time:
        #{log.getCurrentTime()} #{log.getCurrentSec()}
        Server Difference: #{log.getServerTimeDiff().toFixed(2)}
        -----------------------
        #{log.getFirstTime()} #{log.getFirstTimeSec()} first record time
        #{log.getLastTime()} #{log.getLastTimeSec()} last record time
        #{log.getTimeLength().toFixed(2)} seconds
        -----------------------
        #{log.count()} Requests
        #{log.getRecordsPerSecond().toFixed(2)} Requests Per Second
        -----------------------
        #{log.getCurrentTime()} ************************
        #{log.getPastRecords(10,0.5).join '\n'}
        #{log.getCurrentTime()} ************************
        --------------------------
        log.getShortLog()
        </pre>
        """
    catch error
      @write """
        <pre style='font-size:20px; color:red'>
        -----------------------
        #{error.toString()}
        -----------------------
        </pre>
        """

  buildSummaryArea:(containerSelector)->
    out=$(containerSelector)
    out.html("")
    area=$("<div style='position:relative; left:0px; top:0px;  width:550px; height:600px; border:1px solid silver; color:black; overflow-y:hidden;'>mmm<div>")
    out.append(area)
