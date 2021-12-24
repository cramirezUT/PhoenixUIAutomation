## Library Helper file
## Auther: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module SendKeys
	include RSpec::Matchers
	include Selenium

	#### METHODS / LOCATORS ####
  def sendKeysArrowDown
    @browser.send_keys :arrow_down
  end

  def sendKeysArrowUp
    @browser.send_keys :arrow_up
  end

  def sendKeysEnter
    @browser.send_keys :enter
  end

  def sendKeysPageDown
    @browser.send_keys :page_down
  end

  def sendKeysPageUp
    @browser.send_keys :page_up
  end

  def sendKeysTab
    @browser.send_keys :tab
  end

  def sendKeysSetText(set_text)
    @browser.send_keys(set_text)
  end

  def sendKeysPageBack
    @browser.send_keys :command, :arrow_left
  end

  def sendKeysCommandDown
    @browser.send_keys :command, :arrow_down
  end

  def sendKeysClear
    @browser.send_keys :clear
  end

  def sendKeysDelete
    @browser.send_keys :delete
  end

  def sendKeysSpace
    @browser.send_keys :space
  end

  def sendKeysInsert
    @browser.send_keys :insert
  end

  def sendKeysShiftTab
    @browser.send_keys :shift, :tab
  end

  def sendKeysBackspace
    @browser.send_keys :backspace
  end
end
