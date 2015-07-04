module ApplicationHelper

  def self.common_title_ja
    "感じる（はぁと）ナビゲーション"
  end

  def self.common_title_en
    "Startup Weekend Nagoya"
  end

  def self.time_strf( h , m )
    m_2 = sprintf( "%2.2d" , m )
    "#{h}:#{m_2}"
  end

  def number_separated_by_comma( num )
    number_to_currency( num , unit: "" , format: "%n" , precision: 0 )
  end

  def alert_normal_content( controller: nil  , icon_basename: nil , message_while_waiting: nil , schedule_title: nil , code: nil , direction: nil , terminal: nil , time: nil , stop: nil )
    h_locals = {
      controller: controller ,
      icon_basename: icon_basename ,
      message_while_waiting: message_while_waiting ,
      schedule_title: schedule_title ,
      code: code ,
      direction: direction ,
      terminal: terminal ,
      time: time ,
      stop: stop
    }
    raise unless h_locals.values.all?( &:present? )
    render inline: <<-HAML , type: :haml , locals: h_locals
%div{ id: :navi_dom , class: [ controller , icon_basename ] }
  %div{ id: icon_basename.to_s + "_icon" , class: :waiting }
    %i{ class: [ :fa , 'fa-2x' , 'fa-' + icon_basename.to_s ] }
  %p{ id: :message, class: :waiting }
    = message_while_waiting + "が到着したら、"
    != tag(:br)
    != "バイブレーションでお知らせします"
  %div{ class: :schedule }
    %div{ class: :title }
      = schedule_title + "（予定）"
    %div{ class: [ :bound_for , :clearfix ]}
      %div{ class: :code }<
        = code
      %div{ class: [:text , :text_ja , :clearfix ]}
        %p{ class: :direction }<
          = direction + "方面"
        %p{ class: :terminal }<
          = terminal + " ゆき"
      %div{ class: :time }<
        = time
    %p{ class: [:stop , :text_ja]}<
      = stop
  %div{ class: :button }<
    = link_to( '', url_for( controller: controller , action: :stop_vibration ) , method: :post , remote: true )
    %p{ class: :text_en }<
      = "OK"
  %div{ id: :is_vibrate }<
    HAML
  end

end
