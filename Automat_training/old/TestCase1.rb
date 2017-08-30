require_relative 'BaseTest.rb'

class TestCase_1
    homepage = HomePage.new
    
    homepage.popup_close
    homepage.go_to_pizzas
    homepage.show_per_page_6
    homepage.validate_show_per_page_6
	homepage.show_per_page_9
    homepage.validate_show_per_page_9
	homepage.show_per_page_15
    homepage.validate_show_per_page_15
    homepage.select_small_margarita
    homepage.gotobasket
    homepage.verifyammount
    homepage.checkout_link
    homepage.empty_fields_validation
    homepage.close_browser
end