## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module BettingTicketPage
	include RSpec::Matchers
	include Selenium

	$bettingTicketNumber = "8b635-0825f"
	$bettingTicketBuyTicketNumber = "96e7b-06bc0"
	$bettingTicketTicketPrice = "$1.00"
	$bettingTicketTicketType = "Sold-SA"
	$bettingTicketTicketTerminal ="UTQATL"
	$bettingTicketTicketGroup ="TST"
	$bettingTicketTicketDateTime ="TST"
	$bettingTicketTime = Time.new
	$bettingTicketCurrentDateTime = $bettingTicketTime.strftime("%d-%b-%y %I:%M:%S")
	$bettingTicketClaimReason = "Lost"
	$bettingTicketUnclaimReason = "Found"
	$bettingTicketCancelTicketNumber = "3e200-b007c"
	$bettingTicketCancelVerificationCode = "omit"
	$bettingTicketInvalidCancelVerificationCode = "wrong"

	#### Ticket Inquiry METHODS / LOCATORS ####
	def ticketSubMenuTab
		@browser.li(id: 'Command-Menu-Ticket')
	end

	def ticketTerminalTextField
		@browser.text_field(id: 'OperatorTicket-Command-Terminal')
	end

	def ticketTicketTextField
		@browser.text_field(id: 'OperatorTicket-Command-Ticket')
	end

	def ticketRefreshButton
		@browser.button(id: 'OperatorTicket-Command-Refresh')
	end

	def ticketActivityButton
		@browser.button(id: 'OperatorTicket-Command-Activity')
	end

	def ticketQueryButton
		@browser.button(id: 'OperatorTicket-Command-Query')
	end

	def ticketClaimButton
		@browser.button(id: 'OperatorTicket-Command-Claim')
	end

	def ticketUnclaimButton
		@browser.button(id: 'OperatorTicket-Command-Claim')
	end

	def ticketReleaseButton
		@browser.button(id: 'OperatorTicket-Command-Release')
	end

	def ticketCancelButton
		@browser.button(id: 'OperatorTicket-Command-Cancel')
	end

	def ticketCancelButtonDisabled
		@browser.button(xpath: "//*[contains(@id,'OperatorTicket-Command-Cancel') and contains(@title,'Ticket is CASHED')]")
	end

	def ticketBuyButton
		@browser.button(id: 'OperatorTicket-Command-Buy')
	end

	def ticketUnbuyButton
		@browser.button(id: 'OperatorTicket-Command-Buy')
	end

	def ticketHelplButton
		@browser.button(id: 'OperatorTicket-Command-Help')
	end

	def claimTicketModal
		@browser.div(id: 'Confirm')
	end

	def claimTicketModalReasonTextField
		@browser.text_field(xpath: "//*[@id='Confirm-Text']")
	end

	def claimTicketModalNoButton
		@browser.button(id: 'Confirm-No')
	end

	def claimTicketModalYesButton
		@browser.button(id: 'Confirm-Yes')
	end

	def cancelTicketButton
		@browser.button(id: 'OperatorTicket-Command-Cancel')
	end

	def cancelTicketModalReasonTextField
		@browser.text_field(xpath: "//*[@id='Confirm-Verify']")
	end

	def cancelTicketModalNoButton
		@browser.button(id: 'Confirm-No')
	end

	def cancelTicketModalYesButton
		@browser.button(id: 'Confirm-Yes')
	end

	def buyTicketModalYesButton
		@browser.button(id: 'Ack-Yes')
	end

	#### PAGE GETTERS ####
	def getTicketOperatorNumber
		@browser.th(class: 'LargeText BoldText ThemeBackground ThemeText')
	end

	def getTicketOperatorRowTextByIndex(index)
		@browser.element(xpath: "//*[@id='OperatorTicket-Ticket']//*[@data-utrow='0']")
	end

	def getTicketClaimedAlert
		@browser.element(xpath: "//*[@id='OperatorTicket-Error']")
	end

	def getTicketInvalidVerificationCodeAlert
		@browser.element(xpath: "//*[@id='Confirm-Error']")
	end

	def getBuyTicketModal
		@browser.div(class: 'BorderedTitledBox')
	end

	def getBuyTicketSuccessAlert
		@browser.element(xpath: "//*[@id='OperatorTicket-Error']")
	end

	#### PAGE VERIFIERS ####
	def verifyOperatorTicketNumber
		sleep(2)
		expectedOperatorTicketNumber = "#{$ticketNumber}"
		if (expect(getTicketOperatorNumber.text[0..11].gsub!(/[\s!@%\/&"']/,'')).to eq(expectedOperatorTicketNumber)) == true
				puts "#{true}: Operator Ticket Number IS A Match"
			else
				expect { raise StandardError, "Operator Ticket Number NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Operator Ticket Number NOT A Match')
		end
	end

	def verifyOperatorTicketPrice(index)
		sleep(2)
		expectedOperatorTicketRow1Price = "#{$ticketPrice}"
		if (expect(getTicketOperatorRowTextByIndex(index).text[0..5].gsub("[^[:alnum:]\\$\\.\\s]", "")).to include(expectedOperatorTicketRow1Price)) == true
				puts "#{true}: Operator Ticket Price IS A Match"
			else
				expect { raise StandardError, "Operator Ticket Price NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Operator Ticket Price NOT A Match')
		end
	end

	def verifyOperatorTicketType(index)
		expectedOperatorTicketRow1Type = "#{$ticketType}"
		if (expect(getTicketOperatorRowTextByIndex(index).text[5..12].gsub!(/[\s!@%\/&"']/,'')).to include(expectedOperatorTicketRow1Type)) == true
				puts "#{true}: Operator Ticket Type Text IS A Match"
			else
				expect { raise StandardError, "Operator Ticket Sold Type NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Operator Ticket Sold Type NOT A Match')
		end
	end

	def verifyOperatorTicketTerminal(index)
			expectedOperatorTicketTerminal = "#{$ticketTerminal}"
		if (expect(getTicketOperatorRowTextByIndex(index).text[13..19].gsub!(/[\s!@%\/&"']/,'')).to include(expectedOperatorTicketTerminal)) == true
				puts "#{true}: Operator Ticket Terminal Text IS A Match"
			else
				expect { raise StandardError, "Operator Ticket Terminal NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Operator Ticket Terminal NOT A Match')
		end
	end

	def verifyOperatorTicketGroup(index)
			expectedOperatorTicketGroup = "#{$ticketGroup}"
		if (expect(getTicketOperatorRowTextByIndex(index).text[20..23].gsub!(/[\s!@%\/&"']/,'')).to include(expectedOperatorTicketGroup)) == true
				puts "#{true}: Operator Ticket Group Text IS A Match"
			else
				expect { raise StandardError, "Operator Ticket Group NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Operator Ticket Group NOT A Match')
		end
	end

	def verifyOperatorTicketDateTime(index)
			expectedOperatorTicketTime = "#{$currentDateTime}"
		if (expect(getTicketOperatorRowTextByIndex(index).text[24..42].gsub!(/[!@%\/&"']/,'')).to include(expectedOperatorTicketTime)) == true
				puts "#{true}: Operator Ticket Time Text IS A Match"
			else
				expect { raise StandardError, "Operator Ticket Time NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Operator Ticket Time NOT A Match')
		end
	end

	def verifyTicketClaimedAlertIsDisplayed
		expect(getTicketClaimedAlert).to be_truthy
	end

	def verifyTicketButtonIsDisabled
		expect(ticketCancelButtonDisabled).to be_truthy
	end

	def verifyBuyTicketModalIsDisplayed
		expect(getBuyTicketModal).to be_truthy
	end

	def verifyBuyTicketSuccessAlertIsDisplayed
		expectedSuccessMessage = "Ticket 96e7b-06bc0 marked as tote buy"
		expect(getBuyTicketSuccessAlert.text).to eq(expectedSuccessMessage)
		getBuyTicketSuccessAlert.flash(color: ["yellow"])
	end

	def verifyUnbuyTicketSuccessAlertIsDisplayed
		expectedSuccessMessage = "Ticket 96e7b-06bc0 unmarked as tote buy"
		expect(getBuyTicketSuccessAlert.text).to eq(expectedSuccessMessage)
		getBuyTicketSuccessAlert.flash(color: ["yellow"])
	end
end
