require "selenium-webdriver"
require "test/unit"
require "rspec/expectations"


class HomePage 

    
def initialize
    Selenium::WebDriver::Chrome.driver_path = File.join(File.absolute_path('', File.dirname("C://Projects/chromedriver")),"chromedriver","chromedriver.exe")
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to('http://pizzalviv.com/')
    @driver.manage.window.maximize
    end  
  
 
  def close_browser
    @driver.quit
  end 

  def popup_close()
   @driver.manage.timeouts.implicit_wait = 1
   return @driver.find_element(:class_name, "close_popup").click
  end 

  def go_to_pizzas()
    return @driver.find_element(:xpath, "html/body/div[1]/header/div/div[5]/div/nav/ul/li[1]/a").click
  end
 

  def select_small_margarita()
    return @driver.find_element(:xpath, "html/body/div[1]/section/div[3]/div[4]/div[3]/div[2]/div/a[1]").click
  end

def show_per_page_6()
  return @driver.find_element(:xpath, "html/body/div[1]/section/div[3]/div[1]/div/ul/li[1]/a").click
end
def validate_show_per_page_6
 element = @driver.find_element(:css, ".sizes_button.has_popup_auto.slider_add_to_cart")
 elements=Array.new(6)
 elements << element
 elements.length.should == 12
end
 
def show_per_page_9()
  return @driver.find_element(:xpath, "html/body/div[1]/section/div[3]/div[1]/div/ul/li[2]/a").click
end 
def validate_show_per_page_9()
 element = @driver.find_element(:css, ".sizes_button.has_popup_auto.slider_add_to_cart")
 elements=Array.new(9)
 elements << element
 elements.length.should == 18
 end
 
def show_per_page_15()
  return @driver.find_element(:xpath, "html/body/div[1]/section/div[3]/div[1]/div/ul/li[3]/a").click
end 
 def validate_show_per_page_15()
 element = @driver.find_element(:css, ".sizes_button.has_popup_auto.slider_add_to_cart")
 elements=Array.new(15)
 elements << element
 elements.length.should eql == 30
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
    @driver.find_element(:xpath, "//div/a/[text()='Замовити']").click
  end
  
  def empty_fields_validation()
    @driver.save_screenshot("C://Projects/TestPlay/test.png")
  end
  
  
end