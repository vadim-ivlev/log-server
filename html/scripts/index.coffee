
@GLOB=new Common
LOG=null

updater = new LogUpdater
summary = new LogSummary


$ ->
  summary.buildSummaryArea("#out2")
  updater.init()
  updater.onUpdate (log)->
    LOG=log
    summary.show(LOG)

  $("#btnStart0").click ->updater.start(5000)
  $("#btnStop0").click ->updater.stop()

