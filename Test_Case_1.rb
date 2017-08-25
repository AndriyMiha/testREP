require_relative 'PageObjects.rb'

class TestCase_1
    homepage = HomePage.new
    
    homepage.go_to
    homepage.popup_close
    homepage.go_to_pizzas
    Pizza_Page = homepage
    Pizza_Page.validate_show_per_page_6
    Pizza_Page.validate_show_per_page_9
    Pizza_Page.validate_show_per_page_15
    Pizza_Page.select_small_margarita
    Pizza_Page.gotobasket
    Basket.verifyammount
    Basket.checkout_link
    Basket.empty_fields_validation
    homepage.close_browser
end
