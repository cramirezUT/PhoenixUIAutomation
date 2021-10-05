require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module HomePage
	include RSpec::Matchers
	include Selenium

	#### METHODS / LOCATORS ####
	def mainMenuLinks(string)
		@browser.element(xpath: "//*[@id='Main-Menu']//*[text()='#{string}']")
	end

	def endSesstionButtonOption(string)
		@browser.button(text: "#{string}")
	end

	def logOutLink
		@browser.li(xpath: "//*[@id='Main-User-Menu-LogOut']")
	end

	def mainUserMenu
		@browser.li(id: 'Main-User-Menu')
	end

	def mainSystemText
		@browser.element(id: 'Main-System')
	end

	#### FUNCTIONS ####
	def logOutFuction
    mainUserMenu.flash(color: ["yellow"]).hover
    logOutLink.wait_until_present.flash(color: ["yellow"]).hover
		logOutLink.wait_until_present.flash(color: ["yellow"]).click
		endSesstionButtonOption("Yes").wait_until_present.hover
    endSesstionButtonOption("Yes").wait_until_present.click
    endSesstionButtonOption("Yes").wait_while_present
  end

	#### VERIFIERS ####
	def isMainSystemTextDisplayed
		expectedMainSystemText = " V433 FBM - UnitedTote QA FBM"
		if (expect(mainSystemText.text).to eq(expectedMainSystemText)) == true
			then
				mainSystemText.flash(color: ["yellow"])
				puts "#{true}: Main System Text IS A Match"
			else
				expect { raise StandardError, "Main System Text NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Main System Text NOT A Match')
		end
	end
end
