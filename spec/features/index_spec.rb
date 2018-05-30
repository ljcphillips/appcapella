feature 'page should multiple videos' do
  scenario 'first video is displayed' do
    visit ('/')
    visit page.find('#video1')[:src]
    expect(page.status_code).to be(200)
    # expect(page.find('video1')['src']).to have_content 'video1.mov'
  end
end
