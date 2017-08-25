require "selenium-webdriver"
require "test/unit"
 
class SiteSetup < Test::Unit::TestCase

  def initialize(url)
    Selenium::WebDriver::Chrome.driver_path = File.join(File.absolute_path('', File.dirname("C://Projects/chromedriver")),"chromedriver","chromedriver.exe")
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to('http://pizzalviv.com/')
    @driver.manage.window.maximize    
  end
  
   
  def close_popup
   return @driver.find_element(:class_name, "close_popup")
  end
  
  def locate_pizza()
    return @driver.find_element(:xpath, "html/body/div[1]/header/div/div[5]/div/nav/ul/li[1]/a")
  end
  
  def popup()
    @driver.switch_to.alert
    return @driver.find_element(:class_name, "close_popup")
  end
    
  def select_pizza()
    return @driver.find_element(:xpath, "html/body/div[1]/section/div[3]/div[4]/div[3]/div[2]/div/a[1]")
  end
  
  def field_input()
    return @driver.find_element(:id,'login_login_username')
  end
  
  def gotobasket()
    return @driver.find_element(:xpath, "html/body/div[1]/header/div/div[1]/p/a")
  end

  def verifyammount()
     assert(@driver.find_element(:class_name, "price").text.include?("83"),"Assertion Failed")
  end
    
   def checkout_link()
    @driver.find_element(:xpath, "html/body/div[1]/section/div[2]/div[1]/a[2]").click
    sleep 0.2
    @driver.find_element(:html, "/body/div[1]/section/div[2]/div[2]/form/div[7]/a").click
  end
  
  def verify_error
    @driver.save_screenshot("C://Projects/chromedriver")
  end
  
  def close_browser
    @driver.quit
  end
end
