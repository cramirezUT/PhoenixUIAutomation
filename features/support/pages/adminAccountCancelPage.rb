## Class Page Helper File
## Auther: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$accountGroupId = "TST-8683"
$invalidAccountGroupId = "99"

module AccountCancelPage
	include RSpec::Matchers
	include Selenium

	#### Account Cancel METHODS / LOCATORS ####
	def accountCancelModal
		@browser.div(id: 'AccountCancel-Select')
	end

	def accountCancelSearchTextField
		@browser.text_field(id: 'AccountCancel-Select-Account')
	end

	def accountCancelRefreshButton
		@browser.button(id: 'AccountCancel-Select-Refresh')
	end

	def accountCancelHelpButton
		@browser.button(id: 'AccountCancel-Select-Help')
	end

	def accountCancelResultModal
		@browser.div(id: 'AccountCancel-Amounts')
	end

	def accountCancelTicketResults
		@browser.table(id: 'AccountCancel-Tickets')
	end

	def accountCancelTicketResultsByIndex(index)
		@browser.button(id: "AccountCancel-Tickets-#{index}-TicketBox-Number")
	end

	def accountCancelTicketButton
		@browser.button(id: 'AccountCancel-Cancel')
	end

	#### Cancel Confirmation Modal ####
	def accountCancelConfirmationModal
		@browser.div(id: 'Confirm')
	end

	def accountCancelConfirmationModalYesButton
		@browser.button(id: 'Confirm-Yes')
	end

	def accountCancelConfirmationModalNoButton
		@browser.button(id: 'Confirm-No')
	end

	#### GETTERS ####
	def getAccountCancelError
		@browser.label(id: 'AccountCancel-Error')
	end

	def getAccountCancel
		@browser.label(id: 'AccountCancel-Amounts-Cancel')
	end

	#### VERIFIERS ####
	def verifyEventInformationResultByIndex(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountCancelError.text).to include(expectedResult)
		getAccountCancelError.flash(color: ["yellow"])
	end

	def verifyAccountCancelAmount(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountCancel.text).to include(expectedResult)
		getAccountCancel.flash(color: ["yellow"])
	end
end
