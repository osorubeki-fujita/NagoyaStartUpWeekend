class NagoyaNavi::SideLink::index < TokyoMetro::App::Renderer::SideMenu::Link::ToMainContent::Index

  def self.set_root( request )
    self.new(
      request ,
      "行先の登録" ,
      "Set root" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

=begin
  def self.infos( request )
    self.new(
      request ,
      "観光案内" ,
      "Touri" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end
=end
end
