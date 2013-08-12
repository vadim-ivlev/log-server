class @LogUpdater
    timer = null
    callback = null

    onUpdate: (func)->
        callback = func
        console?.log func

    stop: ()=>
        clearInterval timer

    start: (updateTime = 5000)=>
        @stop()
        updateLog()
        timer = setInterval updateLog, updateTime

    updateLog = ->
        $.get GLOB.getFullUrl(), (txt)=>
            console?.log "updated: #{txt.substr(0, 10)}"

            if txt.length > 0
                @myLog = new Log()
                @myLog.addText txt

            callback?(@myLog)
            null


    init: ->
        clearInterval timer
        @myLog = new Log()

    constructor:-> @myLog = new Log()