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

  def alert_normal_content( controller: nil  , icon_basename: nil , message_while_waiting: nil , schedule_title: nil , code: nil , direction: nil , train_type: nil , terminal: nil , time: nil , stop_info: nil , terminal_with_suffix: true )
    if direction.present?
      direction = "#{direction}方面"
    end
    if terminal_with_suffix
      terminal += " ゆき"
    end
    h_locals = {
      controller: controller ,
      icon_basename: icon_basename ,
      message_while_waiting: message_while_waiting ,
      schedule_title: schedule_title ,
      code_n: code ,
      direction: direction ,
      train_type: train_type ,
      terminal: terminal ,
      time: time ,
      stop_infos: [ stop_info ].flatten
    }
    render inline: <<-HAML , type: :haml , locals: h_locals
%div{ id: :navi_dom , class: [ controller , icon_basename ] }
  %div{ id: icon_basename.to_s + "_icon" , class: [ :waiting , :bus_train_icon ] }
    %i{ class: [ :fa , 'fa-2x' , 'fa-' + icon_basename.to_s ] }
  %p{ id: :message, class: :waiting }
    = message_while_waiting + "が到着したら、"
    != tag(:br)
    != "バイブレーションでお知らせします"
  %div{ class: :schedule }<
    %div{ class: :title }
      = schedule_title + "（予定）"
    %div{ class: [ :bound_for , :clearfix ]}
      %div{ class: :code }<
        = code_n
      %div{ class: [:text , :text_ja , :clearfix ]}
        - if direction.present?
          %p{ class: :direction }<
            = direction
        - if train_type.present?
          %p{ class: :train_type }<
            = train_type
        %p{ class: :terminal }<
          = terminal
      %div{ class: :time }<
        = time

    %div{ class: [ :stop_infos , :clearfix ] }
      - stop_infos.each do | info |
        %p{ class: [:stop_info , :text_ja]}<
          = info
  %div{ class: :button }<
    = link_to( '', url_for( controller: controller , action: :stop_vibration ) , method: :post , remote: true )
    %p{ class: :text_en }<
      = "OK"
  %div{ id: :is_vibrate }<
    HAML
  end

end
