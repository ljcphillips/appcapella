feature 'It should be possible to record four videos and mix them together' do
  scenario 'Uploading four videos and pressing mix produces a new video', :js => true do
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
