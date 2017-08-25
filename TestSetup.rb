require "selenium-webdriver"
require "test/unit"
require "rspec/expectations"


class SiteSetup < Test::Unit::TestCase

def initialize
    Selenium::WebDriver::Chrome.driver_path = File.join(File.absolute_path('', File.dirname("C://Projects/chromedriver")),"chromedriver","chromedriver.exe")
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to('http://pizzalviv.com/')
    @driver.manage.window.maximize  
end
  
   
  def close_popup
    @driver.manage.timeouts.implicit_wait = 1  
   return @driver.find_element(:class_name, "close_popup").click
  end
  
  def locate_pizza()
    return @driver.find_element(:xpath, "html/body/div[1]/header/div/div[5]/div/nav/ul/li[1]/a").click
  end
  
  def popup()
    @driver.switch_to.alert
    return @driver.find_element(:class_name, "close_popup")
  end
    
  def select_pizza()
    return @driver.find_element(:xpath, "html/body/div[1]/section/div[3]/div[4]/div[3]/div[2]/div/a[1]").click
  end
  
  def field_input()
    return @driver.find_element(:id,'login_login_username')
  end
  
  def gotobasket()
    return @driver.find_element(:xpath, "html/body/div[1]/header/div/div[1]/p/a").click
  end

  def verifyammount()
    element_value = @driver.find_element(:class_name, "price").text
    element_value.should =~ /(83)/
    puts 'Ammount is correct'
  end
    
   def checkout_link()
    @driver.find_element(:xpath, "html/body/div[1]/section/div[2]/div[1]/a[2]").click
   end
  
  def click_submit()
    @driver.manage.timeouts.implicit_wait = 0.2 
    @driver.find_element(:css, ".button.inl.vmid.makeOrder").click
  end
  
  def verify_error
    @driver.save_screenshot("C://Projects/TestPlay/test.png")
  end
  
  def close_browser
    @driver.quit
  end
end
