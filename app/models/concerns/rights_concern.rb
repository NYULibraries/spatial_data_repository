# frozen_string_literal: true

module RightsConcern
  extend Geoblacklight::SolrDocument

  def rights_text
    "This dataset is only available to members of the <b>New York University</b> community and is limited to <em>current</em> students, staff, and faculty. Do not copy or redistribute this data. If you have questions about what constitutes fair use of this material, please contact us directly at <a href='mailto:data.services@nyu.edu'>data.services@nyu.edu</a>." if nyu? && restricted?
  end

  def nyu?
    fetch(:schema_provider_s).downcase == 'nyu'
  end
end
