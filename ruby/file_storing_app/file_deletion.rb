require 'fileutils'
require_relative './file_storage'
require_relative './helpers'

class FileDeletion
  include FileStorageHelpers

  def self.handle_deletion
    filename = target_file
    return file_not_found(filename) unless
      FileStorageHelpers.verify_file_in_store(filename)
    delete_file(filename)
  end

  def self.file_not_found(filename)
    FileStorageHelpers.clear_screen
    puts "#{filename} does not exist, make sure you spell it correctly"
  end

  def self.target_file
    FileStorageHelpers.clear_screen
    puts 'Enter the full name of the file in the store'
    gets.chomp
  end

  def self.success_message(filename)
    FileStorageHelpers.clear_screen
    puts "#{filename} deleted successfully"
  end

  def self.delete_file(filename)
    file_path = "#{FileStorageHelpers.storage_path}/#{filename}"
    FileUtils.remove_file(file_path)
    success_message(filename)
  end
end
