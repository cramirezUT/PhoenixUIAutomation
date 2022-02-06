## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$sellerId = "UTS1"
$sellerIdInvalid = "TNT"

module AdminSellerMessagePage
	include RSpec::Matchers
	include Selenium

	#### SELLER Message METHODS / LOCATORS ####
	def adminSellerMessageModal
		@browser.div(id: 'SellerMessage-Command')
	end

	def adminSellerMessageModalHelpButton
		@browser.button(id: 'SellerMessage-Command-Help')
	end

	def adminSellerMessageModalSellerTextField
		@browser.text_field(id: 'SellerMessage-Command-Seller')
	end

	#### GETTERS ####
	def getSellerMessageError
		@browser.label(id: 'SellerMessage-Error')
	end

	def getSellerNotLoggedOnError
		@browser.label(id: 'SellerMessage-Error')
	end

	#### VERIFIERS ####
	def verifySellerMessageError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getSellerMessageError.text).to include(expectedResult)
		getSellerMessageError.flash(color: ["yellow"])
	end

	def verifySellerNotLoggedOnError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getSellerNotLoggedOnError.text).to include(expectedResult)
		getSellerNotLoggedOnError.flash(color: ["yellow"])
	end
end
