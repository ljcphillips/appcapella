feature 'page should show four videos' do
  1.upto(4) do |num|
    scenario "video #{num} is displayed" do
      visit '/'
      visit page.find("#video#{num}")[:src]
      expect(page.status_code).to be(200)
    end
  end
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
# end

feature 'Uploads' do
  let(:test_mov_file) { File.absolute_path('spec/fixtures/new_video.mov') }

  1.upto(4) do |num|
    feature "should be able to upload and play video #{num}" do
      scenario 'there should be a video player that does not initially play', :js => true do
        visit '/'
        find("#playButton").click
        get_paused = "$(\"#video#{num}\")[0].paused;"
        is_paused = page.evaluate_script(get_paused)
        expect(is_paused).to eq(true)
      end

      scenario 'It should be possible to upload a video file and play it in the video frame', :js => true do
        visit '/'
        attach_file("video_upload_#{num}", test_mov_file)
        find("#upload_video_#{num}").click
        find("#playButton").click
        get_paused = "$(\"#video#{num}\")[0].paused;"
        is_paused = page.evaluate_script(get_paused)
        expect(is_paused).to eq(false)
      end

      scenario 'It should be possible to play a file and pause it', :js => true do
        visit '/'
        attach_file("video_upload_#{num}", test_mov_file)
        find("#upload_video_#{num}").click
        find("#playButton").click
        sleep 1
        get_paused = "$(\"#video#{num}\")[0].paused;"
        find("#pauseButton").click
        is_paused = page.evaluate_script(get_paused)
        expect(is_paused).to eq(true)
      end
      scenario 'It should be possible to play a file and reset it back to the beginning', :js => true do
        visit '/'
        attach_file("video_upload_#{num}", test_mov_file)
        find("#upload_video_#{num}").click
        find("#playButton").click
        sleep 2
        find("#pauseButton").click
        find("#resetButton").click
        time = page.evaluate_script("$(\"#video#{num}\")[0].currentTime;")
        expect(time).to eq(0)
      end
    end
  end
end

feature 'It should be possible to record a video and have it play back', :js => true do
  scenario 'Upload to the first video pane' do
    Capybara.current_driver = :chrome
    visit ('/')
    find("#record").click
    sleep 1
    find("#stop").click
    page.accept_prompt(with: '1')
    find("#playButton").click
    get_paused = "$('#video1')[0].paused;"
    is_paused = page.evaluate_script(get_paused)
    expect(is_paused).to eq(false)

    Capybara.use_default_driver
  end
end
