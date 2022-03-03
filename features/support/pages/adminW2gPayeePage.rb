## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$payeeTaxId = "ID"

module W2gPayeePage
	include RSpec::Matchers
	include Selenium

	#### Inquiry METHODS / LOCATORS ####
	def payeeW2gModal
		@browser.div(id: 'W2gPayee-Select')
	end

	def payeeW2gModalHelpButton
		@browser.button(id: 'W2gPayee-Select-Help')
	end

	def payeeW2gModalPayeeTaxIdTextField
		@browser.text_field(id: 'W2gPayee-Select-Payee')
	end

	def payeeW2gModalAddButton
		@browser.button(id: 'W2gPayee-Select-Add')
	end

	#### Payee Modal ####
	def payeeW2gPayeeModal
		@browser.div(id: 'Payee')
	end

	def payeeW2gPayeeModalSaveButton
		@browser.button(id: 'Payee-Save')
	end

	def payeeW2gPayeeModalSaveButton
		@browser.button(id: 'Payee-Cancel')
	end

	def payeeW2gPayeeModalTaxIdTextField
		@browser.text_field(id: 'Payee-TaxId')
	end

	def payeeW2gPayeeModalTaxIdTextField
		@browser.text_field(id: 'Payee-TaxId')
	end

	def payeeW2gPayeeModalLastNameTextField
		@browser.text_field(id: 'Payee-Last')
	end

	def payeeW2gPayeeModalFirstNameTextField
		@browser.text_field(id: 'Payee-First')
	end

	def payeeW2gPayeeModalMiddleNameTextField
		@browser.text_field(id: 'Payee-Middle')
	end

	def payeeW2gPayeeModalCountryTextField
		@browser.text_field(id: 'Payee-Country')
	end

	def payeeW2gPayeeModalCountryInfoButton
		@browser.button(id: 'Payee-CountryInfo')
	end

	def payeeW2gPayeeModalAddressTextField
		@browser.text_field(id: 'Payee-Address')
	end

	def payeeW2gPayeeModalCityTextField
		@browser.text_field(id: 'Payee-City')
	end

	def payeeW2gPayeeModalStateTextField
		@browser.text_field(id: 'Payee-State')
	end

	def payeeW2gPayeeModalStateInfoButton
		@browser.button(id: 'Payee-StateInfo')
	end

	def payeeW2gPayeeModalZipTextField
		@browser.text_field(id: 'Payee-Zip')
	end

	def payeeW2gPayeeModalFirstIdTextField
		@browser.text_field(id: 'Payee-FirstId')
	end

	def payeeW2gPayeeModalSecondIdTextField
		@browser.text_field(id: 'Payee-SecondId')
	end

	def payeeW2gPayeeModalLockedCheckbox
		@browser.label(xpath: "//*[contains(text(),'Locked')]")
	end
	#####################

	#### GETTERS ####

	#### VERIFIERS ####
end
