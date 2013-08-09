
@GLOB=new Common
LOG=null
updatePeriod=5000
timerPeriod=100
startTime=10

updater = new LogUpdater
summary = new LogSummary
shortSpan = new ShortSpan
timer = new Timer
timer.setCallback ->
  shortSpan.show LOG, startTime, 0.001 * timerPeriod


$ ->
  summary.buildSummaryArea "#out2"
  shortSpan.buildDrawArea "#out2"
  updater.init()
  updater.onUpdate (log)->
    LOG=log
    summary.show(LOG)


  $("#btnStart0").click ->
                    updater.start updatePeriod
                    timer.start timerPeriod

  $("#btnStop0").click ->
                    updater.stop()
                    timer.stop()


  $("#sldFreq").change ->
                  fr=$("#sldFreq").val()
                  timerPeriod =1000.0/fr
#                  console?.log "Frequency: #{fr} Period:#{timerPeriod}"
                  timer.stop()
                  timer.start timerPeriod
