describe 'Accessibility', type: :feature do
  before do
    sign_in
  end
  it 'has no accessibility errors' do
    visit bookmarks_path
    expect(page).to be_axe_clean.within ('body')
  end
end
