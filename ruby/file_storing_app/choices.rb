require_relative './constants'

class Choices
  def self.show_choices
    puts 'Please select the corresponding choice number'

    CHOICES.each do |choice, description|
      puts "#{choice} - #{description}"
    end
  end

  def self.fetch_selected_choice
    gets.chomp
  end

  def self.invalid_choice
    puts 'Invalid choice, try again'
  end

  def self.choice_valid?(choice)
    !CHOICES[choice].nil?
  end

end
