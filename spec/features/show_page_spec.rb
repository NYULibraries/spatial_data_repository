# frozen_string_literal: true

describe 'Show page' do
  context 'with restricted NYU result - nyu-2451-34626' do
    it 'the displays warning message' do
      visit solr_document_path 'nyu-2451-34626'
      expect(page).to have_content 'This dataset is only available to members of the New York University community'
    end

    it 'does not display download' do
      visit solr_document_path 'nyu-2451-34626'
      expect(page).not_to have_content 'Export'
    end

    it 'includes link to login' do
      visit solr_document_path 'nyu-2451-34626'
      expect(page).to have_link('Login to View and Download')
    end
  end

  context 'with suppressed download - nyu-2451-38684' do
    it 'includes warning' do
      visit solr_document_path 'nyu-2451-38684'
      expect(page).to have_selector 'div.alert.alert-warning'
    end

    it 'includes survey link' do
      visit solr_document_path 'nyu-2451-38684'
      expect(page).to have_link(
        'this brief survey', href: 'https://nyu.qualtrics.com/jfe/form/SV_42ddIXjT0CtaqAR'
      )
    end

    it 'does not display download' do
      visit solr_document_path 'nyu-2451-38684'
      expect(page).not_to have_content 'Download'
    end

    it 'includes DOI for citation' do
      visit solr_document_path 'nyu-2451-38684'
      expect(page).to have_content 'Please cite this study using the DOI'
    end
  end

  # TODO: Refactor this to play nice with Rubocop
  # rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
  context 'with multiple downloads - nyu-2451-38645' do #
    it 'includes six download links' do
      visit solr_document_path 'nyu-2451-38645'
      expect(page).to have_content 'Download'
      click_on 'Download'

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
  # rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations
end
