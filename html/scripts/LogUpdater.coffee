class @LogUpdater
  timer=null
  callback=null

  onUpdate:(func)->
    callback=func
    console?.log func

  stop:()=>
    clearInterval timer

  start:(updateTime=5000)=>
    @stop()
    updateLog()
    timer=setInterval updateLog, updateTime

  updateLog=->
    @myLog=new Log()
    $.get GLOB.FULL_URL , (txt)=>
      console?.log "updated: #{txt.substr(0,10)}"
      @myLog.addText txt
      callback?(@myLog)
      null


  init:=>
    clearInterval timer
    @myLog=new Log()
