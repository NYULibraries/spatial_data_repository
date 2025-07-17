# frozen_string_literal: true

describe 'Show page' do
  context 'with restricted NYU result - nyu-2451-34626' do
    context 'when signed out' do
      it 'the displays warning message' do
        visit solr_document_path 'nyu-2451-34626'
        expect(page).to have_content 'This dataset is only available to members of the New York University community'
      end

      it 'does not display download' do
        visit solr_document_path 'nyu-2451-34626'
        # rubocop:disable Capybara/NegationMatcherAfterVisit
        expect(page).to have_no_content 'Export'
        # rubocop:enable Capybara/NegationMatcherAfterVisit
      end

      it 'includes link to login' do
        visit solr_document_path 'nyu-2451-34626'
        expect(page).to have_link('Login to View and Download')
      end
    end

    context 'when signed in' do
      before do
        login_as(create(:user), scope: :user)
      end

      it 'shows a download button' do
        visit solr_document_path 'nyu-2451-34626'
        expect(page).to have_button('Download')
      end

      it 'opens download links in a new tab' do
        visit solr_document_path 'nyu-2451-34626'
        click_button('Download')

        within_window(window_opened_by { click_link('Original Shapefile') }) do
          expect(page.title).not_to include('NYU Spatial Data Repository')
        end
      end
    end
  end

  context 'with suppressed download - nyu-2451-38684' do
    it 'includes warning' do
      visit solr_document_path 'nyu-2451-38684'
      expect(page).to have_css 'div.alert.alert-warning'
    end

    it 'does not display download' do
      visit solr_document_path 'nyu-2451-38684'
      # rubocop:disable Capybara/NegationMatcherAfterVisit
      expect(page).to have_no_content 'Download'
      # rubocop:enable Capybara/NegationMatcherAfterVisit
    end

    it 'includes DOI for citation' do
      visit solr_document_path 'nyu-2451-38684'
      expect(page).to have_link(
        'doi:10.17609/N8MQ0N', href: 'https://doi.org/10.17609/N8MQ0N'
      )
    end
  end

  # TODO: Refactor this to play nice with Rubocop
  # rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
  context 'with multiple downloads - nyu-2451-38645' do
    it 'includes six download links' do
      visit solr_document_path 'nyu-2451-38645'
      expect(page).to have_content 'Download'
      click_on 'Download'

      expect(page).to have_content('LAZ (Point-cloud)')
      expect(page).to have_content('LAS (Full-waveform)')
      expect(page).to have_content('Pulsewaves (Full-waveform)')
      expect(page).to have_content('GeoTIFF (Geo-referenced RGB)')
      expect(page).to have_content('GeoTIFF (Geo-referenced CIR)')
      expect(page).to have_content('JPG (Oblique photos)')
    end
  end
  # rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations

  describe 'Accessibility' do
    it 'has no accessibility errors' do
      visit solr_document_path 'nyu-2451-38684'
      expect(page).to be_axe_clean.within('.show-document')
    end
  end
end
