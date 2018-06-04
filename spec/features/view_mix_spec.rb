feature 'page should show the mixed video' do

  scenario 'Mix video should exist and play', :js => true do
    visit '/'
    attach_file("video_upload_1", Appcapella.root + '/spec/new_video.mov')
    find("#upload_video_1").click
    attach_file("video_upload_2", Appcapella.root + '/spec/new_video.mov')
    find("#upload_video_2").click
    attach_file("video_upload_3", Appcapella.root + '/spec/new_video.mov')
    find("#upload_video_3").click
    attach_file("video_upload_4", Appcapella.root + '/spec/new_video.mov')
    find("#upload_video_4").click
    find("#mix").click
    page.evaluate_script("$('#mix_video').get(0).play()")
    get_paused = "$('#mix_video')[0].paused;"
    is_paused = page.evaluate_script(get_paused)
    expect(is_paused).to eq(false)
  end

end
