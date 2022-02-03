## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

@random = rand(9999)
$sellerId = "UTS1"
$sellerIdInvalid = "TNT"

module AdminSellerBalancePage
	include RSpec::Matchers
	include Selenium

	#### SELLER BALANCE METHODS / LOCATORS ####
	def adminSellerBalanceModal
		@browser.div(id: 'SellerBalance-Command')
	end

	def adminSellerBalanceModalSellerTextField
		@browser.text_field(id: 'SellerBalance-Command-Seller')
	end

	def adminSellerBalanceModalExpandButton
		@browser.button(id: 'SellerBalance-Command-Expand')
	end

	def adminSellerBalanceModalRefreshButton
		@browser.button(id: 'SellerBalance-Command-Refresh')
	end

	def adminSellerBalanceModalHelpButton
		@browser.button(id: 'SellerBalance-Command-Help')
	end

	#### BALANCE MODAL ####
	def adminSellerBalanceResultModal
		@browser.div(id: 'SellerBalance-Balance')
	end

	def adminSellerBalanceResultModalBeginningBalance
		@browser.div(id: 'SellerBalance-Balance-0-1')
	end

	def adminSellerBalanceResultModalSellerPayments
		@browser.div(id: 'SellerBalance-Balance-1-1')
	end

	def adminSellerBalanceResultModalTerminalBalance
		@browser.div(id: 'SellerBalance-Balance-4-1')
	end

	def adminSellerBalanceResultModalEndingBalance
		@browser.div(id: 'SellerBalance-Balance-6')
	end
	#######################

	#### GETTERS ####
	def getSellerBalanceError
		@browser.label(id: 'SellerBalance-Error')
	end

	#### VERIFIERS ####
	def verifySellerBalanceError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getSellerBalanceError.text).to include(expectedResult)
		getSellerBalanceError.flash(color: ["yellow"])
	end
end
