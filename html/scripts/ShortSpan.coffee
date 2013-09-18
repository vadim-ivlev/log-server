class @ShortSpan
  desk=null
  outerContainer=null



  clear :() -> desk.html ""

  write : (text) ->
    desk.html(desk.html() + text)

  show:(log, startTime=10, period=0.5 )->
    if not log then return

    @clear()
    toTheEnd=(log.getLastTimeSec()- (GLOB.getCurrentSec()-startTime)  ).toFixed(2)
    @write  """
        <pre>
        S H O R T   T I M E   S P A N
        --------------------------
        Current Time: #{log.getCurrentTime()} #{log.getCurrentSec()}
        Start time: #{startTime} Period: #{period.toFixed 3} Frequency: #{Math.round 1/period}
        Time to the the end of log: #{toTheEnd} seconds
        -----------------------
        #{log.getPastRecords(startTime,period).join '\n'}
        </pre>
        """
        #{log.getPastRecords(startTime,period).join '\n'}

  constructor:(containerSelector)->
    outerContainer=$(containerSelector)
    desk=$("#outputArea")
