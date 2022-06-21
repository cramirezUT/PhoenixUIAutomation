## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminContestPayPlayerGroupdId = "TL1-1"
$adminContestPayPlayerGroupdIdInvalid = "TNT"

module ContestPayPage
	include RSpec::Matchers
	include Selenium

	#### CONTEST PAY METHODS / LOCATORS ####
	def contestPayModal
		@browser.div(id: 'ContestPay-Select')
	end

	def contestPayHelpButton
		@browser.button(id: 'ContestPay-Select-Help')
	end

  def contestPaySearchTextField
    @browser.text_field(id: 'ContestPay-Select-Account')
  end
	##########################################

	#### GETTERS ####
	def getContestPayError
		@browser.label(id: 'ContestPay-Error')
	end

	#### VERIFIERS ####
	def verifyContestPaysError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getContestPayError.text).to include(expectedResult)
		getContestPayError.flash(color: ["yellow"])
	end

	def verifyContestPayModal
		sleep(1)
		expect(contestPayTournamentModal).to be_truthy
		contestPayTournamentModal.flash(color: ["yellow"])
	end

	def verifyContestPayContestModal
		sleep(1)
		expect(contestPayContestModal).to be_truthy
		contestPayContestModal.flash(color: ["yellow"])
	end
end
