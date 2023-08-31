# frozen_string_literal: true

describe 'Homepage' do
  describe 'DOM' do
    it 'has Featured Collections' do
      visit root_path
      expect(page).to have_content 'Featured Collections'
    end

    it 'has Featured Maps' do
      visit root_path
      expect(page).to have_content 'Featured Maps'
    end
  end
  describe 'Accessibility' do
    it 'has no accessibility errors' do
      visit root_path
      expect(page).to be_axe_clean.within '.blacklight-catalog-index'
    end
  end
end
