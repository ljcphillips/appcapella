require_relative '../../fbdetails'

feature 'User can share video on facebook' do
  scenario 'facebook share button posts mixed video on user profile', js: true do
    visit '/view_mix'
    find('#fb-share').click

    # Switch focus to popup window
    page.driver.switch_to_window(page.driver.window_handles.last)

    fill_in('email', with: FBEMAIL)
    fill_in('pass', with: FBPASSWORD)
    # Log In button
    find('#u_0_0').click
    # Post to Facebook button
    find('#u_0_1x').click
    visit 'http://facebook.com/' + FBPROFILE
    expect(page).to have_content('appcapella.herokuapp.com')
  end

  # A more simple test, perhaps more secure so we don't have to store our details?
  # scenario 'facebook share button posts mixed video on user profile', js: true do
  #   visit '/view_mix'
  #   find('#fb-share').click
  #
  #   # Switch focus to popup window
  #   page.driver.switch_to_window(page.driver.window_handles.last)
  #   expect(page).to have_content('Facebook')
  # end
end
