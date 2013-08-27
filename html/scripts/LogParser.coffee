###
  Log parser class.

  Used to parse logs of Apache, Nginx and other servers

###
class @LogParser


  getSeconds = (timeString)->
    a = timeString.split ":"
    3600 * a[0] + 60 * a[1] + 1 * a[2]


#  Static method. Converts a log line to an instance of log object
  @parseLine : (line)->
    a = line.split /\s+/
    rand = Math.random()
    strRand=(""+rand).substr(1,4)
    o =
      line: line
      time: a[2] + strRand
      timeSec: getSeconds(a[2]) + rand
      ip: a[5]
      method: a[10]
      request: a[11]
      response: a[13]
      size: a[14]
      userAgent: a[16]


