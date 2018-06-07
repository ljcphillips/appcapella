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


    # expect('www.facebook.com/' + FBPROFILE).to have_content('appcapella.herokuapp.com')
  end
end
