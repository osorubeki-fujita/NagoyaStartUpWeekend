class VibrationHandler

  include ::Singleton

  def approaching
    !!( @approaching )
  end

  def to_vibrate
    !!( @to_vibrate )
  end

  def approaching!
    @approaching = true
    @to_vibrate = true
  end

  def stop_vibration!
    @approaching = false
    @to_vibrate = false
  end

end
