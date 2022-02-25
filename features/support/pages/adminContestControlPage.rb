## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$tournamentdId = "T02"
$tournamentdIdInvalid = "T100"
$dateTime = DateTime.now
$dateTimePlus1Day = $dateTime + 1
$dateTimePlus2Days = $dateTime + 2
$currentDateTime = $dateTime.strftime("%d %b %Y")
$currentDateTimePlus1Day = $dateTimePlus1Day.strftime("%d %b %Y")
$currentDateTimePlus2Days = $dateTimePlus2Days.strftime("%d-%b-%Y %I:%M:%S %p")

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
    @browser.text_field(id: 'inputContestControl-Contest-NoEntry')
  end

	def contestControlContestModalNoEntryCalendarButton
    @browser.div(id: 'ContestControl-Contest-NoEntry-seconddiv')
  end

	def contestControlContestModalEndTimeCalendarButton
    @browser.div(id: 'ContestControl-Contest-End-thirddiv')
  end

	def contestControlContestModalEndTimeCalendarTodayLink
		sleep(1000)
    @browser.element(xpath: "//*[contains(@id,'calendarFooterViewinnerCalendarjqxWidget12ae287bc525')]//a[contains(@class,'jqx-calendar-footer jqx-calendar-footer-summer') and contains(text(),'Today')]")
  end

	def contestControlContestModalEndTimeCalendarClearLink
		sleep(1000)
    @browser.element(xpath: "//*[contains(@id,'calendarFooterViewinnerCalendarjqxWidget12ae287bc525')]//a[contains(@class,'jqx-calendar-footer jqx-calendar-footer-summer') and contains(text(),'Clear')]")
  end

	def contestControlContestModalNoEntryCalendarTodayLink
		sleep(1000)
    # @browser.element(xpath: "//*[contains(@id,'calendarFooterViewinnerCalendarjqxWidget0bcdf0bb743c')]//a[contains(@class,'jqx-calendar-footer jqx-calendar-footer-summer') and contains(text(),'Today')]")
		# @browser.element(xpath: "/html/body/div[4]/div[1]/div/div[2]/table/tbody/tr/td[1]/a")
		@browser.td(xpath: "//*[contains(@id,'ViewinnerCalendarjqxWidget')]//*[contains(@id,'todayButtonViewinnerCalendarjqxWidget')]")

  end

	def contestControlContestModalNoEntryCalendarClearLink
		sleep(1000)
    # @browser.element(xpath: "//*[contains(@id,'calendarFooterViewinnerCalendarjqxWidget0bcdf0bb743c')]//a[contains(@class,'jqx-calendar-footer jqx-calendar-footer-summer') and contains(text(),'Clear')]")
		# @browser.td(xpath: "/html/body/div[4]/div[1]/div/div[2]/table/tbody/tr/td[2]/a")
		@browser.td(xpath: "//*[contains(@id,'ViewinnerCalendarjqxWidget')]//*[contains(@id,'doneButtonViewinnerCalendarjqxWidget')]")


  end

	def contestControlContestModalNoEntryCalendarByDay(day)
		sleep(1000)
    @browser.element(xpath: "//*[contains(@id,'cellTableViewinnerCalendarjqxWidgetb8a125ab341b')]//*[contains(@class,'jqx-rc-all jqx-rc-all-summer jqx-item jqx-item-summer jqx-calendar-cell jqx-calendar-cell-summer jqx-calendar-cell-month jqx-calendar-cell-month-summer') and contains(text(),'#{day}')]")
  end

	def contestControlContestModalEndTimeCalendarByDay(day)
		sleep(1000)
    @browser.element(xpath: "//*[contains(@id,'cellTableViewinnerCalendarjqxWidget7a75db07f3c9')]//*[contains(@class,'jqx-rc-all jqx-rc-all-summer jqx-item jqx-item-summer jqx-calendar-cell jqx-calendar-cell-summer jqx-calendar-cell-month jqx-calendar-cell-month-summer') and contains(text(),'#{day}')]")
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
