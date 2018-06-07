feature 'User can share video on facebook' do
  scenario 'facebook share button posts mixed video on user profile', js: true do
    visit '/view_mix'
    find('#fb-share').click

    # Switch focus to popup window
    page.driver.switch_to_window(page.driver.window_handles.last)
    expect(page).to have_content('Facebook')
  end
end
