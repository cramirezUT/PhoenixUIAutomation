## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/adminBalanceSheetPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include AdminBalanceSheetPage
end

RSpec.describe "Admin->Balance:  Balance Sheet validation", :regression do
  begin
    before(:all) do
      puts "AdminBalanceSheetPage"
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
      adminMenuLinks("Balance").wait_until_present.flash(color: ["yellow"]).click
		end

    it "Verifies Admin Balance Sheet modal" do
      adminBalanceModal.wait_until_present.flash(color: ["yellow"])
    end

		it "Clicks on the Group dropdown" do
			adminBalanceModalGroupDropdown.flash(color: ["yellow"]).click
		end

		it "Sets the Group Id" do
			adminBalanceModalGroupSearchTextField.flash(color: ["yellow"]).set ($groupId)
			sendKeysEnter
			sendKeysTab
		end

		it "Closes the UTS balance sheet" do
			adminBalanceSheetModalCancelButton.flash(color: ["yellow"]).click
		end

		it "Clicks on the Settings button" do
			adminBalanceSettingsButton.flash(color: ["yellow"]).click
		end
		#### SETS TEXT IN Aa TEXT FIELD ####
		it " Verifies the Cell Editor modal" do
			adminBalanceSheetCellEditorModal.flash(color: ["yellow"])
		end

		it "Clicks on the Label radio button" do
			adminBalanceSheetCellEditorModalTypeByName('Label').flash(color: ["yellow"]).click
		end

		it "Sets text in the Label text field" do
			adminBalanceSheetCellEditorModalLabelTextField.flash(color: ["yellow"]).set ($textForField)
		end

		it "Clicks on the right arrow" do
			adminBalanceSheetCellEditorModalRightArrow.flash(color: ["yellow"]).click
			adminBalanceSheetCellEditorModalRightArrow.flash(color: ["yellow"]).click
			sleep(1)
		end
		### SETS TEXT IN Ba TEXT FIELD ####
		it " Verifies the Cell Editor modal" do
			adminBalanceSheetCellEditorModal.flash(color: ["yellow"])
		end

		it "Clicks on the Label radio button" do
			adminBalanceSheetCellEditorModalTypeByName('Label').flash(color: ["yellow"]).click
		end

		it "Sets text in the Label text field" do
			adminBalanceSheetCellEditorModalLabelTextField.flash(color: ["yellow"]).set ($textForField)
		end

		it "Clicks on the right arrow" do
			adminBalanceSheetCellEditorModalRightArrow.flash(color: ["yellow"]).click
			adminBalanceSheetCellEditorModalRightArrow.flash(color: ["yellow"]).click
			sleep(1)
		end
		### SETS TEXT IN Ca TEXT FIELD ####
		it " Verifies the Cell Editor modal" do
			adminBalanceSheetCellEditorModal.flash(color: ["yellow"])
		end

		it "Clicks on the Label radio button" do
			adminBalanceSheetCellEditorModalTypeByName('Label').flash(color: ["yellow"]).click
		end

		it "Sets text in the Label text field" do
			adminBalanceSheetCellEditorModalLabelTextField.flash(color: ["yellow"]).set ($textForField)
		end

		it "Clicks on the right arrow" do
			adminBalanceSheetCellEditorModalRightArrow.flash(color: ["yellow"]).click
			adminBalanceSheetCellEditorModalRightArrow.flash(color: ["yellow"]).click
			sleep(1)
		end

		it "Verifies the template sheet values" do
			verifyEditTemplateValueByIndex(0)
			verifyEditTemplateValueByIndex(1)
			verifyEditTemplateValueByIndex(2)
		end

		it "Clicks on the Close button" do
			adminBalanceSheetEditTemplateModalCloseButton.flash(color: ["yellow"]).click
		end

		it "Verifies the Confirm Template Close modal" do
			adminBalanceSheetConfirmTemplateModal.flash(color: ["yellow"])
		end

		it "Clicks on the Yes button within the Confirm Template Close modal" do
			adminBalanceSheetConfirmTemplateModalYesButton.flash(color: ["yellow"]).click
		end
	ensure
	after(:all) do
		logOutFuction
		close_browser
	end
	end
end