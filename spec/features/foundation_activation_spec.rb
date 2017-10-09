require 'rails_helper'

feature 'In order to activate a foundation' do
  include AuthenticationHelpers

  background do
    @user = a_signed_in_user
  end

  scenario 'A donor joins an existing community foundation that not yet activated' do
    Given 'a foundation that is just below the activation threshold'
    When 'a user makes a pledge that meets the thresholds'
    Then 'the foundation is activated'
    And 'tokens are distributed to funders'
  end

  def a_foundation_that_is_just_below_the_activation_threshold
    @foundation = FactoryGirl.create :foundation, :near_activation
  end

  def a_user_makes_a_pledge_that_meets_the_thresholds
    visit root_path
    within('#nav-mobile') do
      click_on 'user-menu-toggle'
    end

    click_on 'My profile'
    click_on 'pledges-link'

    within '#pledges' do
      click_on 'join-foundation'
    end

    click_on "Community Foundation of #{@foundation.locality_name} (#{@foundation.postal_code})"
    click_on 'new-pledge'

    expect(page).not_to have_content 'Initial Pledge'
    expect(page).not_to have_field('initial_gas', disabled: true)
    fill_in 'pledge_amount', with: 30
    fill_in 'bank_account', with: 111111111
    fill_in 'bank_routing', with: 999999999
    click_on 'submit-pledge'
  end

  def the_foundation_is_activated
    @foundation.reload
    expect(page).to have_content "This foundation is currently active."
    click_on 'view-foundation'
    within('#status') do
      expect(page).to have_content "Active"
      expect(page).to have_content "activated on <strong>#{@foundation.activated_on.strftime('%e %B, %Y')}</strong>."
    end
    within('#balance') do
      expect(page).to have_content @foundation.pledge_total
    end
  end

 # def tokens_are_distributed_to_funders
 #   within('#navbar') do
 #     expect(page).to have_content "Token balance: 30"
 #   end
 # end
end

