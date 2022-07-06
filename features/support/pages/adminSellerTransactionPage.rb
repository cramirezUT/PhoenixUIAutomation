## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminSellerTransactionSellerId = "TST-10"
$adminSellerTransactionSellerIdInvalid = "TNT"
$adminSellerTransactionSellerTypeOptionPayment = "Payment"
$adminSellerTransactionSellerTypeOptionAdjust = "Adjust"
$adminSellerTransactionSellerAmountOneDollar = "1.00"

module AdminSellerTransactionPage
	include RSpec::Matchers
	include Selenium

	#### SELLER TRANSACTION METHODS / LOCATORS ####
	def adminSellerTransactionModal
		@browser.div(id: 'SellerTransaction-Command')
	end

	def adminSellerTransactionModalHelpButton
		@browser.button(id: 'SellerTransaction-Command-Help')
	end

	def adminSellerTransactionModalTypeDropdown
		@browser.button(id: 'SellerTransaction-Command-Type-mainbutton')
	end

	def adminSellerTransactionModalTypeSearchTextField
		@browser.text_field(id: 'SellerTransaction-Command-Type-search')
	end

	def adminSellerTransactionModalSellerTextField
		@browser.text_field(id: 'SellerTransaction-Command-Seller')
	end

	def adminSellerTransactionModalCurrencyDropdown
		@browser.button(id: 'SellerTransaction-Command-Currency-mainbutton')
	end

	def adminSellerTransactionModalCurrencySearchTextField
		@browser.text_field(id: 'SellerTransaction-Command-Currency-search')
	end

	def adminSellerTransactionModalCurrencyAmountTextField
		@browser.text_field(id: 'SellerTransaction-Command-Amount')
	end

	def adminSellerTransactionModalSubmitButton
		@browser.button(id: 'SellerTransaction-Command-Submit')
	end

	def adminSellerTransactionModalClearButton
		@browser.button(id: 'SellerTransaction-Command-Clear')
	end

	#### GETTERS ####
	def getAdminSellerTransactionHistory
		@browser.element(xpath: "//*[contains(@id,'SellerTransaction-History-Container-Items')]//*[contains(@id,'SellerTransaction-History-Content')]")
	end

	#### VERIFIERS ####
	def verifySellerTransactionHistrory(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminSellerTransactionHistory.text).to include(expectedResult)
		getAdminSellerTransactionHistory.flash(color: ["yellow"])
	end
end
