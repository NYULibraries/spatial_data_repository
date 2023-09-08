describe 'Accessibility', type: :feature do
  before do
    login_as(create(:user), scope: :user)
  end

  it 'has no accessibility errors' do
    visit bookmarks_path
    expect(page).to be_axe_clean.within('#main-container')
  end
end
