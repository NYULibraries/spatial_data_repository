describe 'Search' do
  describe 'Spelling suggestions' do
    it 'are turned on' do
      visit root_path
      fill_in 'q', with: 'prince'
      click_button 'search'
      expect(page).to have_content 'Did you mean to type:'
    end
  end
end
