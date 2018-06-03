feature 'page should show the mixed video' do

  scenario 'Mix video player is displayed' do
    visit '/view_mix'
    visit page.find('#mix')[:src]
    expect(page.status_code).to be(200)
  end
end