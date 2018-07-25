class Switch
  attr_reader :status

  def initialize
    @status = 'off' # this is an instance variable,
    # and it can be accessed my any instance method inside the class
  end

  def toggle
    if @status == 'off'
      @status = 'on'
    elsif status == 'on'
      @status = 'off'
    end
  end

  def self.class_method # this class method will never have access to the value of @status variable, it will always return nil value
    puts @status
  end
end


switch = Switch.new

puts switch.status

switch.toggle

puts switch.status

switch.toggle

puts switch.status

switch.toggle

puts switch.status

puts Switch.class_method # class method will return nil
