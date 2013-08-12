@GLOB = new Common
LOG = null
updatePeriod = 5000
timerPeriod = 100
startTime = 10

updater = null
summary = null
shortSpan = null
drops = null

timer = new Timer
timer.setCallback  ->
    shortSpan.show LOG, startTime, 0.001 * timerPeriod
    drops.show LOG, startTime, 0.001 * timerPeriod
    null


$ ->
    updater = new LogUpdater()
    summary = new LogSummary "#summaryContainer"
    shortSpan = new ShortSpan "#shortSpanContainer"
    drops = new Drops "#dropContainer"


    updater.init()
    updater.onUpdate (log)->
        LOG = log
        summary.show(LOG)


    $("#btnStart0").click ->
        updater.start updatePeriod

    $("#btnStop0").click ->
        updater.stop()

    $("#btnStart1").click ->
        timer.start timerPeriod

    $("#btnStop1").click ->
        timer.stop()

    $("#sldFreq").change ->
        fr = $("#sldFreq").val()
        timerPeriod = 1000.0 / fr
        #console?.log "Frequency: #{fr} Period:#{timerPeriod}"
        timer.stop()
        timer.start timerPeriod

    $("#selectUrl").change ->
        GLOB.setUrl( $("#selectUrl").val() )
        updater.stop()
        updater.start updatePeriod
