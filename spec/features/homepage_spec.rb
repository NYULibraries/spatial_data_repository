# frozen_string_literal: true

describe 'Homepage' do
  describe 'DOM' do
    it 'has Featured Collections' do
      visit root_path
      expect(page).to have_content 'Featured Collections'
      expect(page).to have_selector '.curated-collections'
    end

    it 'has Featured Maps' do
      visit root_path
      expect(page).to have_content 'Featured Maps'
      expect(page).to have_selector '.curated-maps'
    end
  end
end
