require_relative '../../app.rb'

feature 'page should four videos' do

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

  scenario 'third video is displayed' do
    visit '/'
    visit page.find('#video3')[:src]
    expect(page.status_code).to be(200)
  end

  scenario 'fourth video is displayed' do
    visit '/'
    visit page.find('#video4')[:src]
    expect(page.status_code).to be(200)
  end

  # This test can soon be deleted, here for reference for the moment
  # describe "Video Playback Test", :js => true do
  #   scenario 'both videos should start playing on one click' do
  #     visit '/'
  #     find("#playButton").click
  #     get_paused1 = "$('#video1')[0].paused;"
  #     is_paused1 = page.evaluate_script(get_paused1)
  #     expect(is_paused1).to eq(false)
  #     get_paused2 = "$('#video2')[0].paused;"
  #     is_paused2 = page.evaluate_script(get_paused2)
  #     expect(is_paused2).to eq(false)
  #   end
  # end
end

feature 'should be able to upload and play video 1' do
  scenario 'there should be a video player that does not initially play', :js => true do
    visit '/'
    find("#playButton").click
    get_paused = "$('#video1')[0].paused;"
    is_paused = page.evaluate_script(get_paused)
    expect(is_paused).to eq(true)
  end

  scenario 'It should be possible to upload a video file and play it in the video frame', :js => true do
    visit '/'
    p "***********"
    p Appcapella.root
    p "***********"
    attach_file("video_upload_1", Appcapella.root + '/spec/new_video.mov')
    find("#upload_video_1").click
    find("#playButton").click
    get_paused = "$('#video1')[0].paused;"
    is_paused = page.evaluate_script(get_paused)
    expect(is_paused).to eq(false)
  end
end

feature 'should be able to upload and play video 2' do
  scenario 'there should be a video player that does not initially play', :js => true do
    visit '/'
    find("#playButton").click
    get_paused = "$('#video2')[0].paused;"
    is_paused = page.evaluate_script(get_paused)
    expect(is_paused).to eq(true)
  end

  scenario 'It should be possible to upload a video file and play it in the video frame', :js => true do
    visit '/'
    attach_file("video_upload_2", Appcapella.root + '/spec/new_video.mov')
    find("#upload_video_2").click
    find("#playButton").click
    get_paused = "$('#video2')[0].paused;"
    is_paused = page.evaluate_script(get_paused)
    expect(is_paused).to eq(false)
  end
end

feature 'should be able to upload and play video 3' do
  scenario 'there should be a video player that does not initially play', :js => true do
    visit '/'
    find("#playButton").click
    get_paused = "$('#video3')[0].paused;"
    is_paused = page.evaluate_script(get_paused)
    expect(is_paused).to eq(true)
  end

  scenario 'It should be possible to upload a video file and play it in the video frame', :js => true do
    visit '/'
    attach_file("video_upload_3", Appcapella.root + '/spec/new_video.mov')
    find("#upload_video_3").click
    find("#playButton").click
    get_paused = "$('#video3')[0].paused;"
    is_paused = page.evaluate_script(get_paused)
    expect(is_paused).to eq(false)
  end
end

feature 'should be able to upload and play video 4' do
  scenario 'there should be a video player that does not initially play', :js => true do
    visit '/'
    find("#playButton").click
    get_paused = "$('#video4')[0].paused;"
    is_paused = page.evaluate_script(get_paused)
    expect(is_paused).to eq(true)
  end

  scenario 'It should be possible to upload a video file and play it in the video frame', :js => true do
    visit '/'
    attach_file("video_upload_4", Appcapella.root + '/spec/new_video.mov')
    find("#upload_video_4").click
    find("#playButton").click
    get_paused = "$('#video4')[0].paused;"
    is_paused = page.evaluate_script(get_paused)
    expect(is_paused).to eq(false)
  end
end
