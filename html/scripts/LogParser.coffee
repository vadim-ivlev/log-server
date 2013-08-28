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
#    add random millisec to the time
    strRand=(""+rand).substr(1,4)
    responseCode=a[13]
    image =  line.indexOf("fullimage") isnt -1 or  line.indexOf("filterimage") isnt -1
    o =
      line: line
      time: a[2] + strRand
      timeSec: getSeconds(a[2]) + rand
      ip: a[5]
      method: a[10]
      request: a[11]
      response: responseCode
      size: a[14]
      userAgent: a[16]
#      success: 1
      success: responseCode is "200" or responseCode is "304"
      image:image


