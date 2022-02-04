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

module AdminSellerInquiryPage
	include RSpec::Matchers
	include Selenium

	#### SELLER INQUIRY METHODS / LOCATORS ####
	def adminSellerInquiryModal
		@browser.div(id: 'SellerInquiry-Select')
	end

	def adminSellerInquiryModalRefreshButton
		@browser.button(id: 'SellerInquiry-Select-Refresh')
	end

	def adminSellerInquiryModalHelpButton
		@browser.button(id: 'SellerInquiry-Select-Help')
	end

	def adminSellerInquiryModalSellerTextField
		@browser.text_field(id: 'SellerInquiry-Select-Seller')
	end

	#### SUMMARY MODAL ####
	def adminSellerInquirySummaryModal
		@browser.div(id: 'SellerInquiry-Summary')
	end

	def adminSellerInquirySummaryModalDate
		@browser.div(id: 'SellerInquiry-Summary-0-0')
	end
	#######################

	#### GETTERS ####
	def getSellerInquirySummaryDate
		adminSellerInquirySummaryModalDate.text
	end

	def getSellerInquiryError
		@browser.label(id: 'SellerInquiry-Error')
	end

	def getSellerInquirySuccessMessage
		@browser.label(id: 'SellerInquiry-Error')
	end

	#### VERIFIERS ####
	def verifySellerInquiryError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getSellerInquiryError.text).to include(expectedResult)
		getSellerInquiryError.flash(color: ["yellow"])
	end

	def verifySellerInquirySuccesMessafge(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getSellerInquirySuccessMessage.text).to include(expectedResult)
		getSellerInquirySuccessMessage.flash(color: ["yellow"])
	end
end
