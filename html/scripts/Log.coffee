###
  Class Log
  Represents a tail of the server log
###
class @Log



  tailToArray = (tailText)->
    (LogParser.parseLine line for line in  splitTailText tailText)



  splitTailText = (text)->
    a = text.split "\n"
    a.pop()
    a[1..]

  get_short_line = (o, j)->
    text = "#{GLOB.toStr(j, 4)}  #{o.time}   #{o.timeSec.toFixed(3)}   #{GLOB.toStr(o.method, 5)} #{GLOB.toStr(o.response,
      5)} #{GLOB.toStr(o.size, 10)}"
    if o.method == "not"
      text += "#{o.request}<br/>"
      text += "#{o.line}<br/>"
    return text

  get_long_line = (o, j)->
    text = "#{j} #{o.line}"


  #PUBLIC  -------------------------------------------------------

  getCurrentTime: ->
    d = new Date()
    "#{d.getHours()}:#{d.getMinutes()}:#{d.getSeconds()}.#{d.getMilliseconds()}"

  getCurrentSec: ->
    d = new Date()
    3600 * d.getHours() + 60 * d.getMinutes() + d.getSeconds() + 0.001 * d.getMilliseconds()

  getPastRecords: (backSec, spanSec)->
    now = @getCurrentSec()
    ( get_short_line o, i for o,i in @LOG when now - o.timeSec > backSec and now - o.timeSec < (backSec + spanSec))

  getPastRecords2: (backSec, spanSec)->
    now = @getCurrentSec()
    ( o for o in @LOG when now - o.timeSec > backSec and now - o.timeSec < (backSec + spanSec))


  addText: (text)->
    @LOG = tailToArray text
  getShortLog: ->
    (get_short_line(o, j) for o,j in @LOG).join "\n"
  getLongLog: ->
    (get_long_line(o, j) for o,j in @LOG).join "\n"
  getServerTimeDiff: ()->
    @getCurrentSec() - @getLastTimeSec()
  getTimeLength: ->
    @getLastTimeSec() - @getFirstTimeSec()
  getFirstTime: ->
    @LOG[0].time
  getFirstTimeSec: ->
    @LOG[0].timeSec
  getLastTime: ->
    @LOG[@count() - 1].time
  getLastTimeSec: ->
    @LOG[@count() - 1].timeSec
  count: ->
    @LOG.length
  getRecordsPerSecond: ->
    @count() / @getTimeLength()






