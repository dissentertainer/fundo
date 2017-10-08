require 'rails_helper'

feature 'In order to hold community funds securely' do

  scenario 'A donor creates a foundation proposal and deploys it to the Ethereum blockchain' do
    Given 'a donor on the landing page'
    When 'they click the create foundation button'
    When 'the donor submits the form with foundation parameters'
    Then 'they see a status page for the foundation with key stats'
  end

  def a_donor_on_the_landing_page
    visit root_path
  end

  def they_click_the_create_foundation_button
    click_on 'create-foundation'
  end

  def the_donor_submits_the_form_with_foundation_parameters
    select 'United States', from: 'foundation_country_alpha2'
    fill_in 'Local currency', with: 'USD'
    fill_in 'Postal code', with: '11206'
    fill_in 'Minimum participants', with: 100
    fill_in 'Minimum starting funds', with: 1000
    fill_in 'Activation deadline', with: 30.days.from_now.strftime('%e %B, %Y')
    click_on 'create'
  end

  def they_see_a_status_page_for_the_foundation_with_key_stats
    @foundation = Foundation.last
    expect(page).to have_content "Community Foundation of Bushwick (11206)"
    expect(page).to have_content @foundation.address
    expect(page).to have_content "1000 USD required in order to activate"
    expect(page).to have_content "100 funders required in order to activate"
    # expect(page).to have_content @foundation.pledge_total
    # expect(page).to have_content @foundation.pledges.count
    # expect(page).to have_content @foundation.activation_deadline
    # expect(page).to have_content @foundation.latitude
    # expect(page).to have_content @foundation.longitude
  end
end
