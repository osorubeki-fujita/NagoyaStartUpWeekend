class VibrationLoop

  constructor: ->

  is_vibrate = (v) ->
    return ( navigator.vibrate or navigator.webkitVibrate or navigator.mozVibrate or navigator.msVibrate )

  process: ->
    set_text(@)
    set_loop(@)
    return

  set_text = (v) ->
    if is_vibrate(v)
      txt = "対応"
    else
      txt = "非対応"
    $('#is_vibrate').html( txt )
    return

  set_loop = (v) ->
    if is_vibrate(v)
      setInterval( 'check_vibration_setting()' , 500 );
    return

window.VibrationLoop = VibrationLoop

check_vibration_setting = () ->
  console.log 'check_vibration_setting'
  json_url = 'http://192.168.100.109:3000/to_vibrate.json'
  f = ( obj ,c , jq_xhr) ->
    console.log obj
    if c is 'success' and obj.to_vibrate
      navigator.vibrate([2000,1000,2000,1000,2000,1000,2000])
      $('#bus_icon').removeClass( 'waiting' ).addClass( 'arriving' )
      $('p#message').removeClass( 'waiting' ).addClass( 'arriving' ).text( "バスが到着します" )
    else
      navigator.vibrate(0)
    return
  $.getJSON( json_url , null , f )
  return

window.check_vibration_setting = check_vibration_setting
