feature 'page should multiple videos' do
  scenario 'first video is displayed' do
    visit ('/')
    visit page.find('#video1')[:src]
    expect(page.status_code).to be(200)
  end
  scenario 'second video is displayed' do
    visit ('/')
    visit page.find('#video2')[:src]
    expect(page.status_code).to be(200)
  end
end
