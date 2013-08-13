class @GeoLocator
  desk=null
  hash ={}
  callback=null

  printLocation = (o) ->
    desk.html desk.html() + o.toString()

  constructor:(containerSelector)->
    input= $ "<input>"
    button = $ "<button>Lookup</button>"
    desk = $ "<div>"

    button.click ->
      @lookup input.val()

    desk.append input
    desk.append button

    $(containerSelector).append(desk)


  setCallback:(func)->
    @callback = func

  lookup:(ip)->
      return hash[ip] if hash[ip]
      $.get "http://freegeoip.net/json/#{ip}", (data)->
          hash[ip]=data
          printLocation data
          callback? data


