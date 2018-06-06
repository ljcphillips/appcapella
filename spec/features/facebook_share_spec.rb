require_relative '../../fbdetails'

feature 'User can share video on facebook' do
  scenario 'facebook share button posts mixed video on user profile' do
    visit '/view_mix'
    # find('#fb-share').click

    within('#fb-share') do
      fill_in('email', with: FBEMAIL)
      fill_in('pass', with: FBPASSWORD)
      find('#u_0_0').click
      find('#u_0_1x').click
    end

    # main = page.switch_to_window page.windows.first
    # popup = page.switch_to_window page.windows.last

    # main = page.driver.current_window_handle.first
    # popup = page.driver.current_window_handle.last


    # login_window = window_opened_by do
    #   click_button('fb-share')
    # end
    # within_window(popup) do
    #   fill_in('email', with: FBEMAIL)
    #   fill_in('pass', with: FBPASSWORD)
    #   find('#u_0_0').click
    #   find('#u_0_1x').click
    # end
    # expect('www.facebook.com/' + FBPROFILE).to have_content('appcapella.herokuapp.com')
  end
end
