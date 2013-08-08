class @Common

  ###
  Global varaiables
  ###

  PROXY = ""
  URL = "http://172.16.57.226/tails/tail200k.txt?"


  #URL : "http://217.67.191.109/tails/tail200k.txt?"
#  URL = "http://www.obd-memorial.ru/tails/tail200k.txt?"
  # URL : "http://www2.obd-memorial.ru/tails/tail200k.txt?"
  # URL : "http://www1.obd-memorial.ru/tails/tail200k.txt?"
  # PROXY : "/proxy/"

  FULL_URL : PROXY + URL + Math.random()


  ###
  Common functions
  ###

  ###
  padding the string s with spaces
  s - the string to pad
  L - total length
  ###
  toStr : (s, L)->
    ss = "" + s
    sh = "                                        "
    len = ss.length
    if L < len
      ss.substr(0, L)
    else
      sh.substr(0, L - len) + ss


