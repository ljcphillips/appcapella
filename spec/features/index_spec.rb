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
      get_paused1 = "$('#video1')[0].paused;"
      is_paused1 = page.evaluate_script(get_paused1)
      expect(is_paused1).to eq(false)
      get_paused2 = "$('#video2')[0].paused;"
      is_paused2 = page.evaluate_script(get_paused2)
      expect(is_paused2).to eq(false)
    end
  end
end

feature 'should upload and play a video' do
  scenario 'there should be a video player ready for the uploaded video' do
    visit '/'
    visit page.find('#video_new')[:src]
    expect(page.status_code).to be(200)
  end
end
