## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminAccountFindFirstName = "Julie"
$adminAccountFindLastName = "Anchorsteam"
$adminAccountFindFirstNameInvalid = "Operation"
$adminAccountFindLastNameInvalid = "Ivy"

module AccountFindPage
	include RSpec::Matchers
	include Selenium

	#### Find METHODS / LOCATORS ####
	def findAccountModal
		@browser.div(id: 'AccountFind-Search')
	end

	def findAccountHelpButton
		@browser.button(id: 'AccountFind-Search-Help')
	end

	def findAccountSearchButton
		@browser.button(id: 'AccountFind-Search-Search')
	end

	def findAccountClearSearchButton
		@browser.button(id: 'AccountFind-Search-Clear')
	end

	def findAccountFirstNameTextField
		@browser.text_field(id: 'AccountFind-Search-First-Text')
	end

	def findAccountLastNameTextField
		@browser.text_field(id: 'AccountFind-Search-Last-Text')
	end

	def findAccountExternalTextField
		@browser.text_field(id: 'AccountFind-Search-External-Text')
	end

	def findAccountEmailTextField
		@browser.text_field(id: 'AccountFind-Search-Email-Text')
	end

	def findAccountValidationTextField
		@browser.text_field(id: 'AccountFind-Search-Validation-Text')
	end

	def findAccountUserTextField
		@browser.text_field(id: 'AccountFind-Search-User-Text')
	end

	def findAccountTaxIdTextField
		@browser.text_field(id: 'AccountFind-Search-TaxId-Text')
	end

	def findAccountPatronTextField
		@browser.text_field(id: 'AccountFind-Search-Patron-Text')
	end

	def findAccountIdTextField
		@browser.text_field(id: 'AccountFind-Search-Id-Text')
	end

	def findAccountDOBTextField
		@browser.text_field(id: 'inputAccountFind-Search-DOB-Text')
	end

	def findAccountCityTextField
		@browser.text_field(id: 'AccountFind-Search-City-Text')
	end

	def findAccountStateTextField
		@browser.text_field(id: 'AccountFind-Search-State-Text')
	end

	def findAccountZipTextField
		@browser.text_field(id: 'AccountFind-Search-Zip-Text')
	end

	def findAccountCountryTextField
		@browser.text_field(id: 'AccountFind-Search-Country-Text')
	end

	def findAccountPhoneTextField
		@browser.text_field(id: 'AccountFind-Search-Phone-Text')
	end

	#### GETTERS ####
	def getFindAccountError
		@browser.label(id: 'AccountFind-Error')
	end
	#### Account Modal ####
	def getFindAccountAccountModal
		@browser.div(id: 'AccountFind-Account')
	end

	def getFindAccountAccountModalFirstNameLabel
		@browser.label(id: 'AccountFind-Account-First-Text')
	end

	def getFindAccountAccountModalLastNameLabel
		@browser.label(id: 'AccountFind-Account-Last-Text')
	end
	#######################
	#######################

	#### VERIFIERS ####
	def verifyFindAccountErrorSearchResults(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getFindAccountError.text).to include(expectedResult)
		getFindAccountError.flash(color: ["yellow"])
	end

	def verifyFindAccountSearchResults(result)
		sleep(1)
		expectedResult = "#{result}"
		expectedGet = getFindAccountAccountModalFirstNameLabel.text + " " + getFindAccountAccountModalLastNameLabel.text
		expect(expectedGet).to include(expectedResult)
		getFindAccountAccountModalFirstNameLabel.flash(color: ["yellow"])
		getFindAccountAccountModalLastNameLabel.flash(color: ["yellow"])
	end
end
