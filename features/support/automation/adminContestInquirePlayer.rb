## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminContestInquirePlayerPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include ContestInquirePlayerPage
end

RSpec.describe "Admin->Contest->Inquire->Player: Contest Inquire Player verification test", :regression do
  begin
    before(:all) do
      $continue = true
      puts "adminContestInquirePlayerTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
    end

    around(:each) do |example|
      if $continue
        $continue = false
        example.run
        $continue = true unless example.exception
      else
        example.skip
      end
    end

    after(:each) do |example|
      if example.exception
  	    screenshot_file = "features/support/automation_screenshots/filesAccountBlock-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
  	    @browser.driver.save_screenshot(screenshot_file)
        sleep 1
        @browser.quit
      end
    end

    it "Verifies the main system text in the header menu" do
      isMainSystemTextDisplayed
    end

		it "Clicks on the Admin tab in the main menu" do
			mainMenuLinks("Admin").wait_until_present.flash.click
		end

		it "Clicks on the Contest tab" do
      adminMenuLinks("Contest").wait_until_present.flash.click
		end

		it "Hovers on the Inquire link" do
			eventMenuLinks("Inquire").wait_until_present.flash.hover
		end

		it "Clicks on the Player sub link" do
			eventMenuInquireSubLinks("Player").flash.click
		end

		it "Verifies the Player Inquiry modal" do
			playerInquiryModal.flash
		end

		it "Sets an invalid Player id in search text field" do
			playerInquiryModalPlayerSearchTextField.flash.set ($playerIdInvalid)
			sendKeysEnter
		end

		it "Verifies the Player No match error" do
			verifyPlayerInquiryError('A group must be specified! <group id>-<number>')
		end
		#### FILTERS ALL OPTION ####
		it "Sets a vaild Player id" do
			playerInquiryModalPlayerSearchTextField.flash.click
      playerInquiryModalPlayerSearchTextField.flash.set ($playerId)
      sendKeysEnter
		end

		it "Clicks on the Request button" do
			playerInquiryModalRequestButton.flash.click
		end

		it "Verifies the Player All result modal" do
			verifyPlayerResultModal
		end
		#### FILTERS OUTS OPTION ####
		it "Sets the filter option" do
			playerInquiryModalFilterDropdown.flash.click
      playerInquiryModalFilterSearchTextField.flash.set ($filterOptionOuts)
      sendKeysEnter
			sendKeysTab
		end

		it "Clicks on the Request button" do
			playerInquiryModalRequestButton.flash.click
		end

		it "Verifies the Player Outs result modal" do
			verifyPlayerResultModal
		end
		#### FILTERS EVENTS OPTION ####
		it "Sets the filter option Events" do
			playerInquiryModalFilterDropdown.flash.click
      playerInquiryModalFilterSearchTextField.flash.set ($filterOptionEvents)
      sendKeysEnter
			sendKeysTab
		end

		it "Clicks on the Events dropdown" do
			playerInquiryModalEventsDropdown.flash.click
		end

		it "Sets text in the Events text field" do
			playerInquiryModalEventsSearchTextField.flash.set ($eventsOptionText)
		end

		it "Clicks on the ALL option" do
			playerInquiryModalEventsSearchOptionAll.flash.click
		end

		it "Clicks on the Races dropdown" do
			playerInquiryModalRacesDropdown.flash.click
		end

		it "Clicks on the All option for the Race field" do
			playerInquiryModalRacesAllOption.flash.click
		end

		it "Clicks on the Pools dropdown" do
			playerInquiryModalPoolsDropdown.flash.click
		end

		it "Sets text in the Pools search text field" do
			playerInquiryModalPoolsSearchTextField.flash.set ($eventsOptionText)
		end

		it "Clicks on the ALL option" do
			playerInquiryModalPoolsAllOption.flash.click
		end

		it "Clicks on the Request button" do
			playerInquiryModalRequestButton.flash.click
		end

		it "Verifies the Player Outs result modal" do
			verifyPlayerResultModal
		end
		#### FILTERS CASH OPTION ####
		it "Sets the filter option to Cash" do
			playerInquiryModalFilterDropdown.flash.click
      playerInquiryModalFilterSearchTextField.flash.set ($filterOptionCash)
      sendKeysEnter
			sendKeysTab
		end

		it "Clicks on the Request button" do
			playerInquiryModalRequestButton.flash.click
		end

		it "Verifies the Player Outs result modal" do
			verifyPlayerResultModal
		end
		#### FILTERS COUPON OPTION ####
		it "Sets the filter option to Coupon" do
			playerInquiryModalFilterDropdown.flash.click
      playerInquiryModalFilterSearchTextField.flash.set ($filterOptionCoupon)
      sendKeysEnter
			sendKeysTab
		end

		it "Clicks on the Request button" do
			playerInquiryModalRequestButton.flash.click
		end

		it "Verifies the Player Outs result modal" do
			verifyPlayerResultModal
		end
		#### FILTERS PENDING OPTION ####
		it "Sets the filter option to Pending" do
			playerInquiryModalFilterDropdown.flash.click
			playerInquiryModalFilterSearchTextField.flash.set ($filterOptionPending)
			sendKeysEnter
			sendKeysTab
		end

		it "Clicks on the Request button" do
			playerInquiryModalRequestButton.flash.click
		end

		it "Verifies the Player Outs result modal" do
			verifyPlayerResultModal
		end
		#### FILTERS CHANGES OPTION ####
		it "Sets the filter option to Changes" do
			playerInquiryModalFilterDropdown.flash.click
			playerInquiryModalFilterSearchTextField.flash.set ($filterOptionChanges)
			sendKeysEnter
			sendKeysTab
		end

		it "Clicks on the Request button" do
			playerInquiryModalRequestButton.flash.click
		end

		it "Verifies the Player Outs result modal" do
			verifyPlayerResultModal
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
