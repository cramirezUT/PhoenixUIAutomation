## Class Page Helper file
## Auther: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'
require_relative "../lib/Users.rb"

module ToteLoginPage
	include RSpec::Matchers
	include Selenium

	#### METHODS / LOCATORS ####
	def loginButton
		@browser.button(id: 'Login-Request')
	end

	def cancelButton
		@browser.button(id: 'Login-Cancel')
	end

	def passwordTextField
		@browser.text_field(id: 'Login-Password')
	end

	def usernameTextField
		@browser.text_field(id: 'Login-User')
	end

	def duplicateModalYesButton
		@browser.button(id: 'Ack-Yes')
	end

	def duplicateModalNoButton
		@browser.button(id: 'Ack-No')
	end

	#### FUNCTIONS ####
	def logInFunction
		usernameTextField.wait_until_present.flash(color: ["yellow"]).set ($toteUsername)
		sendKeysTab
		passwordTextField.flash(color: ["yellow"]).set ($totePassword)
		sendKeysTab
		loginButton.wait_until_present.flash(color: ["yellow"]).click
		sleep(1)
		if (duplicateModalYesButton.present?) == true
			duplicateModalYesButton.flash(color: ["yellow"]).click
			duplicateModalYesButton.wait_while_present
			loginButton.wait_until_present.flash(color: ["yellow"]).click
			loginButton.wait_while_present
		end
	end
end
