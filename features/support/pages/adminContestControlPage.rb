## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$tournamentdId = "T04"
$tournamentdIdInvalid = "T100"

module ContestControlPage
	include RSpec::Matchers
	include Selenium

	#### CONTEST CONTROL METHODS / LOCATORS ####
	def contestControlModal
		@browser.div(id: 'ContestControl-Select')
	end

	def contestControlHelpButton
		@browser.button(id: 'ContestControl-Select-Help')
	end

	def contestControlTournamentDropdown
		@browser.button(id: 'ContestControl-Select-Tournament-mainbutton')
	end

  def contestControlTournamentSearchTextField
    @browser.text_field(id: 'ContestControl-Select-Tournament-search')
  end
	#### CONTEST CONTROL TOURNAMENT MODAL ####
	def contestControlTournamentModal
    @browser.div(id: 'ContestControl-Tournament')
  end

	def contestControlTournamentModalFinalCheckbox
    @browser.td(xpath: "//*[contains(@utindex,'0') and contains(@data-value,'Final')]")
  end

	def contestControlTournamentModalVerifiedCheckbox
    @browser.td(xpath: "//*[contains(@utindex,'1') and contains(@data-value,'Verified')]")
  end

	def contestControlTournamentModalContestNameByIndex(index)
    @browser.td(data_value: "ContestControl-Tournament-Contests-#{index}-0")
  end
	##########################################

	#### CONTEST CONTROL CONTEST MODAL ####
	def contestControlContestModal
    @browser.div(id: 'ContestControl-Contest')
  end

	def contestControlContestModalRefreshButton
    @browser.button(id: 'ContestControl-Contest-Refresh')
  end

	def contestControlContestModalCloseButton
    @browser.button(id: 'ContestControl-Contest-Close')
  end

	def contestControlContestModalClosedCheckbox
    @browser.td(xpath: "//*[contains(@utindex,'0') and contains(@data-value,'Closed')]")
  end

	def contestControlContestModalNoEntryCheckbox
    @browser.td(xpath: "//*[contains(@utindex,'1') and contains(@data-value,'No Entry')]")
  end

	def contestControlContestModalCheckbox
    @browser.td(xpath: "//*[contains(@utindex,'2') and contains(@data-value,'Final')]")
  end

	def contestControlContestModalVerifiedCheckbox
    @browser.td(xpath: "//*[contains(@utindex,'3') and contains(@data-value,'Verified')]")
  end

	def contestControlContestModalEndTimeTextField
    @browser.text_field(id: 'inputContestControl-Contest-End')
  end

	def contestControlContestModalNoEntryTimeTextField
    @browser.text_field(id: 'inputContestControl-Contest-End')
  end
	##########################################

	#### GETTERS ####
	def getcontestControlTournamentError
		@browser.li(id: 'ut-ms-opt-ContestControl-Select-Tournament_noresults')
	end

	#### VERIFIERS ####
	def verifyContestControlsError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getcontestControlTournamentError.text).to include(expectedResult)
		getcontestControlTournamentError.flash(color: ["yellow"])
	end

	def verifyContestControlTournamentModal
		sleep(1)
		expect(contestControlTournamentModal).to be_truthy
		contestControlTournamentModal.flash(color: ["yellow"])
	end

	def verifyContestControlContestModal
		sleep(1)
		expect(contestControlContestModal).to be_truthy
		contestControlContestModal.flash(color: ["yellow"])
	end
end
