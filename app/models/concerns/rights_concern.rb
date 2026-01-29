# frozen_string_literal: true

module RightsConcern
  extend Geoblacklight::SolrDocument

  def rights_text
    "This dataset is only available to members of the <b>New York University</b> community and is limited to <em>current</em> students, staff, and faculty. Do not copy or redistribute this data. If you have questions about what constitutes fair use of this material, please contact us directly at <a href='mailto:data.services@nyu.edu'>data.services@nyu.edu</a>.<br/><br/>Please note that access while on the NYU wifi network or via <a href='https://www.nyu.edu/life/information-technology/infrastructure/network-services/vpn.html'>NYU VPN</a> is required to preview the data below; authenticated users may use the asset download features without NYU VPN." if nyu? && restricted?
  end

  def nyu?
    fetch(:schema_provider_s).casecmp('nyu').zero?
  end
end
