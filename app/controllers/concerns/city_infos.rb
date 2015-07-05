module CityInfos

  def index
    set_controller
    render "#{@controller}/index" , layout: 'application'
  end

  def admin
    set_controller
    render "application/admin" , layout: 'application'
  end

  def to_vibrate
    set_controller
    render "application/to_vibrate.json" , layout: nil
  end

  def approaching
    ::VibrationHandler.instance.approaching!
  end

  def stop_vibration
    ::VibrationHandler.instance.stop_vibration!
  end

  def now_vibrating
    ::VibrationHandler.instance.now_vibrating!
  end

  private

  def set_controller
    @controller = self.class.controller_path
  end

end
