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

module AccountPendingPage
	include RSpec::Matchers
	include Selenium

	#### ACCOUNT Pending METHODS / LOCATORS ####
	def accountPendingModal
		@browser.div(id: 'AccountPending-Select')
	end

	def accountPendingSearchTextField
		@browser.text_field(id: 'AccountPending-Select-Account')
	end

	def accountPendingHelpButton
		@browser.button(id: 'AccountPending-Select-Help')
	end

	#### GETTERS ####
	def getAccountPendingError
		@browser.label(id: 'AccountPending-Error')
	end
	#### PENDING TICKET MODAL ####
	def getAccountPendingTicketModal
		@browser.div(id: 'AccountPending-Tickets-0-TicketBox')
	end

	def getAccountPendingTicketModalTicketByIndex(index)
		@browser.button(id: "AccountPending-Tickets-#{index}-TicketBox-Number")
	end
	###############################
	def getAccountPendingError
		@browser.label(id: "AccountPending-Error")
	end

	def getAccountPendingTicketResult
		@browser.element(xpath: "//table[@id='AccountPending-Ticket']")
	end
	##################

	#### VERIFIERS ####
	def verifyAccountPendingError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountPendingError.text).to include(expectedResult)
		getAccountPendingError.flash(color: ["yellow"])
	end

	def verifyEventTicketResult
		sleep(1)
		expect(getAccountPendingTicketResult.present?).to be_truthy
		getAccountPendingTicketResult.flash(color: ["yellow"])
	end
end
