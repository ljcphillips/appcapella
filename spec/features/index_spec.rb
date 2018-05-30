feature 'page should multiple videos' do
  scenario 'first video is displayed' do
    visit '/'
    visit page.find('#video1')[:src]
    expect(page.status_code).to be(200)
  end
  scenario 'second video is displayed' do
    visit '/'
    visit page.find('#video2')[:src]
    expect(page.status_code).to be(200)
  end

  describe "Video Playback Test", :js => true do
  scenario 'both videos should start playing on one click' do
    visit '/'
    find("#playButton").click
    video = find("#video1")
    get_paused = "$('#video1')[0].paused;"
    is_paused = page.evaluate_script(get_paused)
    expect(is_paused).to eq(false)
  end
end
end
