class @ShortSpan
  desk=null
  outerContainer=null

  beginTime:10

  clear :() -> desk.html ""

  write : (text) ->
    desk.html(desk.html() + text)

  show:(log, startTime=10, period=0.5 )->
    @clear()
    try
      @write """
        <h3>Short time span</h3>
        <pre>
        Current Time: #{log.getCurrentTime()} #{log.getCurrentSec()}
        Start time: #{@beginTime} Period: #{period.toFixed 3} Frequency: #{Math.round 1/period}
        -----------------------
        #{sec0=log.getCurrentSec()} start filter time
        -----------------------
        #{log.getPastRecords(startTime,period).join '\n'}
        -----------------------
        #{sec1=log.getCurrentSec()} end filter time
        --------------------------
        filter time #{sec1-sec0} seconds
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

  buildDrawArea:(containerSelector)->
    outerContainer=$(containerSelector)

    desk=$("<div
      style='
      position:absolute;
      left:550px;
      top:0px;
      width:550px;
      border:1px dotted #F00;
      font-family:sans-serif;
      color:black;
      overflow-x:hidden;
      '><div>")
    outerContainer.append(desk)
