class VibrationHandler

  include ::Singleton

  def approaching
    !!( @approaching )
  end

  def to_vibrate
    !!( @to_vibrate )
  end

  def now_vibrating
    !!( @now_vibrating )
  end

  def now_vibrating!
    @now_vibrating = true
  end

  def approaching!
    @approaching = true
    @to_vibrate = true
    @now_vibrating = false
  end

  def stop_vibration!
    @approaching = false
    @to_vibrate = false
    @now_vibrating = false
  end

end
