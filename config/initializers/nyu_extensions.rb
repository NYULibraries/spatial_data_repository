## Loads and requires all Ruby classes in lib/nyugeoblacklight

Dir["#{Rails.root}/lib/nyugeoblacklight/*.rb"].each {|file| require file }