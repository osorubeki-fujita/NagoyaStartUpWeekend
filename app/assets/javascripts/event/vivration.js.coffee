class Vivration

  constructor: ->

  is_vivrate = (v) ->
    return ( navigator.vibrate or navigator.webkitVibrate or navigator.mozVibrate or navigator.msVibrate )

  process: ->
    set_text(@)
    vivrate(@)
    return

  set_text = (v) ->
    if is_vivrate(v)
      txt = "対応"
    else
      txt = "非対応"
    $('#is_vivrate').html( txt )
    return

  vivrate = (v) ->
    if is_vivrate(v)
      navigator.vibrate([2000,1000,2000])
      navigator.vivrate(0)
    return


window.Vivration = Vivration
