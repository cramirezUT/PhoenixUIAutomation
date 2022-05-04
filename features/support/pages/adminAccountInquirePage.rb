## Class Page Helper file
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$accountGroupId = "TST-8683"
$invalidAccountGroupId = "99"
$eventOptionAQD = "AQD"
$eventRaceOption = "1"
$eventPoolOption = "Win"


module AccountInquirePage
	include RSpec::Matchers
	include Selenium

	#### Account Inquiry METHODS / LOCATORS ####
	def accountInquiryModal
		@browser.div(id: 'AccountInquiry-Select')
	end

	def accountInquirySearchTextField
		@browser.text_field(id: 'AccountInquiry-Select-Account')
	end

	def accountInquiryRequestButton
		@browser.button(id: 'AccountInquiry-Select-Request')
	end

	def accountInquiryFilterDropdown
		@browser.button(id: 'AccountInquiry-Select-Option-Mode-mainbutton')
	end

	def accountInquiryFilterTextSearchField(filterOption)
		@browser.text_field(id: 'AccountInquiry-Select-Option-Mode-search').flash(color: ["yellow"]).set(filterOption)
	end

	def accountInquiryDocumentOutput
		@browser.div(id: 'AccountInquiry-ScreenOutput')
	end

	def accountInquiryEventsDropdown
		@browser.button(id: 'AccountInquiry-Select-Event-Events-mainbutton')
	end

	def accountInquiryEventsSearchTextField
		@browser.text_field(id: 'AccountInquiry-Select-Event-Events-search')
	end

	def accountInquiryRacesDropdown
		@browser.button(id: 'AccountInquiry-Select-Race-Races-mainbutton')
	end

	def accountInquiryRacesTextField
		@browser.text_field(id: 'AccountInquiry-Select-Race-Races-search')
	end

	def accountInquiryPoolsDropdown
		@browser.button(id: 'AccountInquiry-Select-Pool-Pools-mainbutton')
	end

	def accountInquiryPoolsSearchTextField
		@browser.text_field(id: 'AccountInquiry-Select-Pool-Pools-search')
	end

	def accountInquiryClearButton
		@browser.button(id: 'AccountInquiry-Select-Clear')
	end

	def accountInquiryHelpButton
		@browser.button(id: 'AccountInquiry-Select-Help')
	end

	#### GETTERS ####
	def getAccountInquiryError
		@browser.label(id: 'AccountInquiry-Error')
	end

	#### VERIFIERS ####
	def verifyAccountInquiryError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountInquiryError.text).to include(expectedResult)
		getAccountInquiryError.flash(color: ["yellow"])
	end

	def verifyDocumentOputIsDisplayed
		sleep(1)
		expect(accountInquiryDocumentOutput).to be_truthy
		accountInquiryDocumentOutput.flash(color: ["yellow"])
	end
end
