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
                   <h4>Summary</h4>
                   <pre>
                   Current Time        #{log.getCurrentTime()} #{log.getCurrentSec()}
                   Server Difference   #{log.getServerTimeDiff().toFixed(2)}

                   First record time   #{log.getFirstTime()} #{log.getFirstTimeSec().toFixed(3)}
                   Last record time    #{log.getLastTime()} #{log.getLastTimeSec().toFixed(3)}
                   Time length         #{log.getTimeLength().toFixed(2)}  sec

                   Requests            #{log.count()}
                   Requests Per Second #{log.getRecordsPerSecond().toFixed(2)}
                   </pre>
                   """
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


