class Timer
  timer=null

  constructor=()->
    console?.log "Timer  created"

  callback=null

  setCallback:(func)->
    callback=func

  stop:()=>
    clearInterval timer

  start:(updateTime=1000)=>
    @stop()
    doTheJob()
    timer=setInterval doTheJob, updateTime

  doTheJob=->
    action()
    callback?()


  action=->

