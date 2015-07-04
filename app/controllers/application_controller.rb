class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include TwitterProcessor

  def index
    # set_twitter_processor( :tokyo_metro )
    # @station_infos = ::Station::Info.all.where( operator_id: ::ApplicationHelper.tokyo_metro.id )
    render 'index' , layout: 'application'
  end

  def admin
    render 'admin' , layout: 'application'
  end

  def to_vibrate
    render 'to_vibrate.json' , layout: nil
  end

  def approaching
    ::VibrationHandler.instance.approaching!
  end

  def stop_vibration
    ::VibrationHandler.instance.stop_vibration!
  end

end
