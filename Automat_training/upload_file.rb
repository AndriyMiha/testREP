require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  Selenium::WebDriver::Chrome.driver_path = File.join(File.absolute_path('', File.dirname("C://Projects/chromedriver")),"chromedriver","chromedriver.exe") 
  @driver = Selenium::WebDriver.for :chrome
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do
  filename = 'some-file.txt'
  file = File.join(Dir.pwd, filename)

  @driver.get 'http://the-internet.herokuapp.com/upload'
  @driver.find_element(:id, 'file-upload').send_keys file
  @driver.find_element(:id, 'file-submit').click

  uploaded_file = @driver.find_element(:id, 'uploaded-files').text
  if expect(uploaded_file).to eql filename
  print("Upload succesful")
  else
  print("Upload unsuccesful")
  end
end