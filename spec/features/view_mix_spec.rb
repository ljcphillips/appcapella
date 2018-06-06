feature 'It should be possible to record four videos and mix them together' do
  scenario 'Recording four videos and pressing mix produces a new video', :js => true do
    Capybara.current_driver = :chrome
    1.upto(4) do |num|
      visit ('/')
      find("#record").click
      sleep 1
      find("#stop").click
      page.accept_prompt(with: "#{num}")
    end
    find("#mix").click
    page.evaluate_script("$('#mix_video').get(0).play()")
    get_paused = "$('#mix_video')[0].paused;"
    is_paused = page.evaluate_script(get_paused)
    expect(is_paused).to eq(false)
    Capybara.use_default_driver
  end
end


feature 'It should be possible to upload four videos and mix them together' do

  let(:test_mov_file) { File.absolute_path('spec/fixtures/new_video.mov') }

  scenario 'Uploading four videos and pressing mix produces a new video', :js => true do
    visit ('/')
    1.upto(4) do |num|
      attach_file("video_upload_#{num}", test_mov_file)
      find("#upload_video_#{num}").click
    end
    find("#mix").click
    page.evaluate_script("$('#mix_video').get(0).play()")
    get_paused = "$('#mix_video')[0].paused;"
    is_paused = page.evaluate_script(get_paused)
    expect(is_paused).to eq(false)
  end
end
