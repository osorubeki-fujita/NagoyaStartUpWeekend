
__END__

# ꇐ

TokyoMetro::Api::StationTrainTime.seed( :ginza )

TokyoMetro::Factory::Seed.destroy_all_items_of( ::StationTrainTime )

#--------

::TokyoMetro::Api::StationTrainTime.check_number( :marunouchi , :marunouchi_branch )
::TokyoMetro::Api::StationTrainTime.destory( :marunouchi , :marunouchi_branch )

::TokyoMetro::Api::StationTrainTime.seed( :marunouchi_including_branch )

#--------

・ TrainLocation に prepend
・ TrainLocation 丸ノ内支線 中野坂上駅の名称の挙動（特に中野富士見町～本線）

・ prepend するモジュール内での include と prepend

・ ::Timetable -> ::StationTimetable の変更

・ StationTrainTime seed エラーの挙動

#--------

puts ::TokyoMetro::Api.station_timetables.select { | item | /NakanoSakaue/ =~ item.same_as }.map( &:same_as ).sort
puts ""
puts ::TokyoMetro::Api.station_timetables.select( &:at_nakano_sakaue? ).map( &:same_as ).sort

#--------

puts ::TokyoMetro::Api.station_timetables.select { | item | /NakanoSakaue/ =~ item.same_as }.map( &:same_as ).sort
puts ::TokyoMetro::Api.station_timetables.select( &:at_nakano_sakaue? ).map( &:same_as ).sort
puts TokyoMetro::CommonModules::Decision::CurrentStation.instance_methods.sort

puts ::TokyoMetro::CommonModules::Dictionary::Station::StringList.constants( false ).map( &:to_s ).map( &:downcase ).delete_if { | base_method_name | /_in_system\Z/ === base_method_name }.sort
str = "odpt.Station:TokyoMetro.Marunouchi.NakanoSakaue"
class << str
include TokyoMetro::CommonModules::Decision::CurrentStation
end
str.at_nakano_sakaue?
TokyoMetro::CommonModules::Dictionary::Station::RegexpInfo.nakano_sakaue

puts ::TokyoMetro::Api.station_timetables.select { | item | /NakanoSakaue/ =~ item.same_as }.map( &:station ).sort

#--------

# ary = TokyoMetro::Api::TrainLocation::generate_from_saved_json( 2014 , 10 , 6 , line: "Ginza" , max: 100 )

#--------

::TokyoMetro::Api.station_timetables.select { | timetable |
  timetable.at_honancho_including_invalid? or timetable.at_nakano_fujimicho_including_invalid? or timetable.at_nakano_shimbashi_including_invalid?
}.map { | timetable |
  timetable.timetables.map { | timetable_for_a_day |
    timetable_for_a_day.map( &:terminal_station )
  }
}.flatten.uniq.sort

#--------

::TokyoMetro::Api.station_timetables.select { | timetable |
  timetable.at_honancho_including_invalid? or timetable.at_nakano_fujimicho_including_invalid? or timetable.at_nakano_shimbashi_including_invalid?
}.map { | timetable |
  timetable.timetables.map { | for_each_day |
    for_each_day.select( &:terminate_at_nakano_sakaue? ).length
  }
}.flatten.inject( :+ )

#--------

::TokyoMetro.set_api_constants( { station_timetable: true } )
puts ::TokyoMetro::Api.station_timetables.select( &:marunouchi_line_including_branch? ).length
