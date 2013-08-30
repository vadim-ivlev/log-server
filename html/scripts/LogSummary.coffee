class @LogSummary
    desk = null
    outerContainer = null

    clear: () ->
        desk.html ""


    write: (text) ->
        desk.html(desk.html() + text)


    show: (log)->
        @clear()
        try
            @write """
                   <pre>
                   S U M M A R Y
                   --------------------------
                   #{log.count()} Requests / #{log.getTimeLength().toFixed(2)}  sec
                   Requests Per Second #{log.getRecordsPerSecond().toFixed(2)}
                   </pre>
                   """

#                   <h4>Summary</h4>
#                   Current Time        #{log.getCurrentTime()} #{log.getCurrentSec()}
#                   Server Difference   #{log.getServerTimeDiff().toFixed(2)}
#
#                   First record time   #{log.getFirstTime()} #{log.getFirstTimeSec().toFixed(3)}
#                   Last record time    #{log.getLastTime()} #{log.getLastTimeSec().toFixed(3)}


        catch error
            @write "
                    <pre style='font-size:20px; color:red'>
                    -----------------------
                    #{error.toString()}
                    -----------------------
                    </pre>
                    "

    constructor: (containerSelector)->
        desk = $(containerSelector)


