## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$accountGroupId = "uqa-10032"
$accountGroupIdInvalid = "99"

module AccountPayPage
	include RSpec::Matchers
	include Selenium

	#### ACCOUNT PAY METHODS / LOCATORS ####
	def accountPayModal
		@browser.div(id: 'AccountPay-Select')
	end

	def accountPaySearchTextField
		@browser.text_field(id: 'AccountPay-Select-Account')
	end

	def accountPayRefreshButton
		@browser.button(id: 'AccountPay-Select-Refresh')
	end


	def accountPayHelpButton
		@browser.button(id: 'AccountPay-Select-Help')
	end

	#### GETTERS ####
	def getAccountPayError
		@browser.label(id: 'AccountPay-Error')
	end
	#### PAYEE INFORMATION MODAL ####
	def getAccountPayeeInformationModal
		@browser.div(id: 'AccountPay-Payee')
	end

	def getAccountPayeeInformationModalEditButton
		@browser.div(id: 'AccountPay-Payee-Edit')
	end

	def getAccountPayeeInformationModalFirstNameTextField
		@browser.div(id: 'AccountPay-Payee-First')
	end

	def getAccountPayeeInformationModalMiddleInitialTextField
		@browser.div(id: 'AccountPay-Payee-Middle')
	end

	def getAccountPayeeInformationModalLastNameTextField
		@browser.div(id: 'AccountPay-Payee-Last')
	end

	def getAccountPayeeInformationModalCityTextField
		@browser.div(id: 'AccountPay-Payee-City')
	end

	def getAccountPayeeInformationModalStateTextField
		@browser.div(id: 'AccountPay-Payee-State')
	end

	def getAccountPayeeInformationModalZipTextField
		@browser.div(id: 'AccountPay-Payee-Zip')
	end

	def getAccountPayeeInformationModalCountryTextField
		@browser.div(id: 'AccountPay-Payee-Country')
	end

	def getAccountPayeeInformationModalFirstIdTextField
		@browser.div(id: 'AccountPay-Payee-Id1st')
	end

	def getAccountPayeeInformationModalSecondIdTextField
		@browser.div(id: 'AccountPay-Payee-Id2nd')
	end
	##################################

	def getAccountPayTicketByIndex(index)
		@browser.button(id: "AccountPay-Tickets-#{index}-TicketBox-Number")
	end

	def getAccountPayError
		@browser.label(id: "AccountPay-Error")
	end
	##################

	#### VERIFIERS ####
	def verifyAccountPayError
		sleep(1)
		if (getAccountPayError.present?) == true
			getAccountPayError.flash(color: ["yellow"])
			puts "Payee Information Missing: #{getAccountPayError.text}"
		else
			puts "No Payee Information Error Displayed"
		end
	end

	def verifyEventInformationResult(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountPayError.text).to include(expectedResult)
		getAccountPayError.flash(color: ["yellow"])
	end

	def verifyAccountPayAmount(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountPay.text).to include(expectedResult)
		getAccountPay.flash(color: ["yellow"])
	end
end
