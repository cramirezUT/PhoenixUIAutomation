## e2e RSpec/Ruby Test
## Author: Carlos Ramirez

require_relative "../pages/toteLoginPage.rb"
require_relative "../pages/homePage.rb"
require_relative "../pages/siteSelectPage.rb"
require_relative "../pages/filesPage.rb"
require_relative "../pages/FilesAccountBlockPage.rb"
require_relative "../lib/browsers.rb"
require_relative "../lib/SendKeys.rb"
require_relative "../lib/Users.rb"

RSpec.configure do |c|
  c.include ToteLoginPage
  c.include HomePage
  c.include SiteSelectPage
	c.include Browsers
  c.include SendKeys
  c.include FilesPage
  c.include FilesAccountBlockPage
end

RSpec.describe "Files-Account-Block: Verify the table options in the Displayed Columns modal", :regression do
  begin
    before(:all) do
      puts "filesAccountBlock"
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

		it "Clicks on the Files tab in the main menu" do
			mainMenuLinks("Files").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Sets text in the Files Verification and Access Level fields" do
      filesVerificationAcessTextField.wait_until_present.flash(color: ["yellow"]).set ("change")
      sendKeysEnter
      filesVerificationAcessTextField.wait_until_present.flash(color: ["yellow"]).set ("edit")
      sendKeysEnter
		end

		it "Hovers over the Account sub tab in the commands menu" do
      filesCommandMenuLinks("Account").wait_until_present.flash(color: ["yellow"]).hover
		end

		it "Clicks on the Block sub menu under the Account dropdown" do
      filesAccountMenuLinks("Block").wait_until_present.flash(color: ["yellow"]).click
		end

		it "Verifies the Block Configuration modal is displayed" do
      verifyBlockConfigurationModal
		end

		it "Clicks on the Configuration settings cog to open modal" do
      blockConfigurationSettingsButton.wait_until_present.flash(color: ["yellow"]).click
		end

		it "Verifies the Displayed Columns modal is displayed" do
      verifyBlockConfigurationDisplayColumsPopup
		end

		it "Verifes the text of each row within the Displayed Columns modal" do
      verifyDisplayedColumnsRowsText
		end

    it "Closes the Displayed Columns Modal" do
      blockDisplayedColumsModalCloseButton.flash(color: ["yellow"]).click
      blockDisplayedColumsModalCloseButton.wait_while_present
    end
  ensure
    after(:all) do
      logOutFuction
      close_browser
    end
  end
end
