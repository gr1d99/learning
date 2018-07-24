require 'fileutils'
require_relative './constants'
require_relative './choices'
require_relative './storage'

class FileStorageApp
  def start
    Storage.prepare_storage
    Choices.show_choices
    choice = Choices.fetch_selected_choice
    match_choice_to_action(choice)
  end

  private

  def match_choice_to_action(choice)
    return Choices.invalid_choice unless Choices.choice_valid?(choice)

    case choice
    when '1'
      path = Storage.target_file_path
      Storage.handle_storage(path)
    else
      puts 'Oops!! try again'
    end
  end
end

app = FileStorageApp.new
app.start

