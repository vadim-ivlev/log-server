
@GLOB=new Common

updater = new LogUpdater
summary = new LogSummary


$ ->
  summary.buildSummaryArea("#out2")
  updater.init()
  updater.onUpdate (log)-> summary.show(log)

  $("#btnStart0").click ->updater.start(5000)
  $("#btnStop0").click ->updater.stop()

