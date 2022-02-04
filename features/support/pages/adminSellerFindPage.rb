## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$firstName = "Johnny"
$firstNameInvalid = "TNT"
$middleName = "B"
$lastName = "Goode"
$lastNameInvalid = "TNT"

module AdminSellerFindPage
	include RSpec::Matchers
	include Selenium

	#### SELLER FIND METHODS / LOCATORS ####
	def adminSellerFindModal
		@browser.div(id: 'SellerFind-Command')
	end

	def adminSellerFindModalClearButton
		@browser.button(id: 'SellerFind-Command-Clear')
	end

	def adminSellerFindModalSearchButton
		@browser.button(id: 'SellerFind-Command-Search')
	end

	def adminSellerFindModalHelpButton
		@browser.button(id: 'SellerFind-Command-Help')
	end

	def adminSellerFindModalFirstNameTextField
		@browser.text_field(id: 'SellerFind-Command-First')
	end

	def adminSellerFindModalInitialTextField
		@browser.text_field(id: 'SellerFind-Command-Middle')
	end

	def adminSellerFindModalLastNameTextField
		@browser.text_field(id: 'SellerFind-Command-Last')
	end

	def adminSellerFindModalTaxIdTextField
		@browser.text_field(id: 'SellerFind-Command-Tax-Number')
	end

	#### MATCHING SELLERS MODAL ####
	def adminSellerFindMatchingSellersModal
		@browser.div(id: 'contentSellerFind-List')
	end
	#######################

	#### GETTERS ####
	def getSellerFindError
		@browser.label(id: 'SellerFind-Error')
	end

	def getSellerFindSuccessMessage
		@browser.label(id: 'SellerFind-Error')
	end

	#### VERIFIERS ####
	def verifySellerFindError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getSellerFindError.text).to include(expectedResult)
		getSellerFindError.flash(color: ["yellow"])
	end

	def verifySellerFindSuccesMessafge(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getSellerFindSuccessMessage.text).to include(expectedResult)
		getSellerFindSuccessMessage.flash(color: ["yellow"])
	end
end
