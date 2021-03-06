describe 'Show page' do
  context 'Restricted NYU result - nyu-2451-34626' do
    it 'the displays warning message' do
      visit solr_document_path 'nyu-2451-34626'
      expect(page).to have_content 'This dataset is only available to members of the New York University community'
    end

    it 'does not display download' do
      visit solr_document_path 'nyu-2451-34626'
      expect(page).to_not have_content 'Download'
    end

    it 'includes link to login' do
      visit solr_document_path 'nyu-2451-34626'
      expect(page).to have_link(
        'Login to view and download', href: '/login'
      )
    end
  end

  # context 'Restricted NYU result - nyu-2451-34626 - Signed In' do
  #   it 'does display download' do
  #     sign_in
  #     visit solr_document_path 'nyu-2451-34626'
  #     expect(page).to have_content 'Download'
  #   end
  # end

  context 'Suppressed download - nyu-2451-38684' do
    it 'includes warning' do
      visit solr_document_path 'nyu-2451-38684'
      expect(page).to have_selector 'div.alert.alert-warning'
    end

    it 'includes survey link' do
      visit solr_document_path 'nyu-2451-38684'
      expect(page).to have_link(
        "this brief survey", href: "https://nyu.qualtrics.com/jfe/form/SV_42ddIXjT0CtaqAR"
      )
    end

    it 'does not display download' do
      visit solr_document_path 'nyu-2451-38684'
      expect(page).to_not have_content 'Download'
    end

    it 'includes DOI for citation' do
      visit solr_document_path 'nyu-2451-38684'
      expect(page).to have_content 'Please cite this study using the DOI'
    end
  end

  context 'Multiple downloads - nyu-2451-38645' do
    it 'includes six download links' do
      visit solr_document_path 'nyu-2451-38645'
      expect(page).to have_content 'Downloads'

      expect(page).to have_content('LAZ (Point-cloud)')
      expect(page).to have_link(
        'Export', href: 'https://archive.nyu.edu/retrieve/80003/nyu_2451_38645_pc_F_150326_120403.zip'
      )

      expect(page).to have_content('LAS (Full-waveform)')
      expect(page).to have_link(
        'Export', href: 'https://archive.nyu.edu/retrieve/80002/nyu_2451_38645_fwf_las_F_150326_120403.zip'
      )

      expect(page).to have_content('Pulsewaves (Full-waveform)')
      expect(page).to have_link(
        'Export', href: 'https://archive.nyu.edu/retrieve/80005/nyu_2451_38645_fwf_plswvs_F_150326_120403.zip'
      )

      expect(page).to have_content('GeoTIFF (Geo-referenced RGB)')
      expect(page).to have_link(
        'Export', href: 'https://archive.nyu.edu/retrieve/80240/nyu_2451_38645_rgb_F_150326_120403.zip'
      )

      expect(page).to have_content('GeoTIFF (Geo-referenced CIR)')
      expect(page).to have_link(
        'Export', href: 'https://archive.nyu.edu/retrieve/80001/nyu_2451_38645_cir_F_150326_120403.zip'
      )

      expect(page).to have_content('JPG (Oblique photos)')
      expect(page).to have_link(
        'Export', href: 'https://archive.nyu.edu/retrieve/80004/nyu_2451_38645_oblique_F_150326_120403.zip'
      )
    end
  end

=begin
  context 'Parent/Child relationships - nyu-2451-34666' do
    it 'to inlude relation links' do
      visit solr_document_path 'nyu-2451-34666'
      expect(page).to have_content("Data Relations")
      expect(page).to have_content("Source Datasets")
    end
  end
=end
end
