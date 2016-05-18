unless Settings.LOCAL_CONSTANTS.blank?
  Geoblacklight::Constants::URI = Geoblacklight::Constants::URI.merge(Settings.LOCAL_CONSTANTS.to_hash).freeze
end