require_relative './constants'
require_relative './choices'
require_relative './file_storage'
require_relative './file_deletion'
require_relative './file_list'

class FileStorageApp
  def start
    FileStorage.prepare_storage
    FileStorageHelpers.clear_screen
    Choices.show_choices
    choice = Choices.fetch_selected_choice
    match_choice_to_action(choice)
  end

  private

  def match_choice_to_action(choice)
    return Choices.invalid_choice unless Choices.choice_valid?(choice)
    case choice
    when '1'
      path = FileStorage.target_file_path
      FileStorage.handle_storage(path)
    when '2'
      FileDeletion.handle_deletion
    when '3'
      FileList.handle_listing
    else
      puts 'Oops!! try again'
    end
  end
end

app = FileStorageApp.new
app.start

