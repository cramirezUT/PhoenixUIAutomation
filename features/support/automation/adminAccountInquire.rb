## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminAccountInquirePage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AccountInquirePage
end

RSpec.describe "Admin->Account->Inquiry: Account Group Number validation", :regression do
  begin
    before(:all) do
      puts "adminAccountInquiryTest"
      launchToteBrowser
      selectSiteTable
      logInFunction
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
			mainMenuLinks("Admin").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Clicks on the Account tab" do
      adminMenuLinks("Account").wait_until_present.flash(color: ["yellow"]).click
		end

    it "Clicks on the Handle link" do
      eventMenuLinks("Inquire").wait_until_present.flash(color: ["yellow"]).click
    end

    it "Sets the Account Group Number" do
      accountInquiryModal.wait_until_present.flash(color: ["yellow"])
      accountInquirySearchTextField.wait_until_present.flash(color: ["yellow"]).set ($invalidAccountGroupId)
      sendKeysEnter
    end

		it "Verifies the account Inquiry error" do
			verifyEventInformationResultByIndex('A group must be specified! <group id>-<number>')
		end

		it "Sets a vaild account Inquiry group id" do
			accountInquiryModal.wait_until_present.flash(color: ["yellow"])
			accountInquirySearchTextField.click
			sendKeysClear
      accountInquirySearchTextField.flash(color: ["yellow"]).set ($accountGroupId)
			accountInquirySearchTextField.flash(color: ["yellow"]).set ($accountGroupId)
      sendKeysEnter
		end

		it "Clicks on the request button" do
			accountInquiryRequestButton.flash(color: ["yellow"]).click
		end

		it "Verifies the document output" do
			verifyDocumentOputIsDisplayed
		end

		it "Selects filter option Outs" do
			accountInquiryFilterDropdown.flash(color: ["yellow"]).click
			accountInquiryFilterTextSearchField('Outs')
			sendKeysEnter
		end

		it "Clicks on the request button" do
			accountInquiryRequestButton.flash(color: ["yellow"]).click
		end

		it "Verifies the document output" do
			verifyDocumentOputIsDisplayed
		end

		it "Selects filter option Events" do
			accountInquiryFilterDropdown.flash(color: ["yellow"]).click
			accountInquiryFilterTextSearchField('Events')
			sendKeysEnter
		end

		it "Selects the Events" do
			accountInquiryEventsDropdown.flash(color: ["yellow"]).click
		end

		it "Sets the Event in text field" do
			accountInquiryEventsSearchTextField.flash(color: ["yellow"]).set ($eventOptionAQD)
			sendKeysEnter
			sendKeysEnter
		end

		it "Clicks on the Races dropdown" do
			accountInquiryRacesDropdown.flash(color: ["yellow"]).click
		end

		it "Sets the race number in the text field" do
			accountInquiryRacesTextField.flash(color: ["yellow"]).set ($eventRaceOption)
			sendKeysEnter
			sendKeysEnter
		end

		it "Clicks on the Pools dropdown" do
			accountInquiryPoolsDropdown.flash(color: ["yellow"]).click
		end

		it "Sets the Pools option in text field" do
			accountInquiryPoolsSearchTextField.flash(color: ["yellow"]).set ($eventPoolOption)
			sendKeysEnter
			sendKeysEnter
		end

		it "Clicks on the request button" do
			accountInquiryRequestButton.flash(color: ["yellow"]).click
		end

		it "Verifies the document output" do
			verifyDocumentOputIsDisplayed
		end

		it "Selects filter option Cash" do
			accountInquiryFilterDropdown.flash(color: ["yellow"]).click
			accountInquiryFilterTextSearchField('Cash')
			sendKeysEnter
		end

		it "Clicks on the request button" do
			accountInquiryRequestButton.flash(color: ["yellow"]).click
		end

		it "Verifies the document output" do
			verifyDocumentOputIsDisplayed
		end

		it "Selects filter option Coupon" do
			accountInquiryFilterDropdown.flash(color: ["yellow"]).click
			accountInquiryFilterTextSearchField('Coupon')
			sendKeysEnter
		end

		it "Clicks on the request button" do
			accountInquiryRequestButton.flash(color: ["yellow"]).click
		end

		it "Verifies the document output" do
			verifyDocumentOputIsDisplayed
		end

		it "Selects filter option Pending" do
			accountInquiryFilterDropdown.flash(color: ["yellow"]).click
			accountInquiryFilterTextSearchField('Pending')
			sendKeysEnter
		end

		it "Clicks on the request button" do
			accountInquiryRequestButton.flash(color: ["yellow"]).click
		end

		it "Verifies the document output" do
			verifyDocumentOputIsDisplayed
		end

		it "Selects filter option Changes" do
			accountInquiryFilterDropdown.flash(color: ["yellow"]).click
			accountInquiryFilterTextSearchField('Changes')
			sendKeysEnter
		end

		it "Clicks on the request button" do
			accountInquiryRequestButton.flash(color: ["yellow"]).click
		end

		it "Verifies the document output" do
			verifyDocumentOputIsDisplayed
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end
