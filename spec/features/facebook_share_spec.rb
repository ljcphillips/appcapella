feature 'User can share video on facebook' do
  scenario 'facebook share button posts mixed video on user profile' do
    visit '/view_mix'

    login_window = window_opened_by do
      find('#fb-share').click
    end
    within_window(login_window) do
      fill_in('email', with: 'fbemail')
      fill_in('pass', with: 'fbpassword')
      find('#u_0_0').click
      find('#u_0_1x').click
      expect('www.facebook.com/profile').to have_content('appcapella.herokuapp.com')
    end

    # within_window(page.driver.browser.window_handles.last) do
    #   fill_in('email', with: 'marwaelali@gmail.com')
    #   fill_in('pass', with: '47XJ99qi.')
    #   find('#u_0_0').click
    #   find('#u_0_1x').click
    #   visit 'facebook.com/marwa.ea.7'
    #   expect(page).to have_content('appcapella.herokuapp.com')
    # end
  end
end
