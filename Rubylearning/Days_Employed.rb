require 'date'

module Employee
  attr_accessor :start_date
  
  def employment_length
    days = Date.now - start_date.to_date
    "#{days.to_i} days"
  end
end

class User
  include Employee
  
end

u = User.new
u.start_date = Date.Today - 365