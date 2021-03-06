require 'fileutils'
require_relative './constants'
require_relative './helpers'

class FileStorage
  include FileStorageHelpers

  def self.target_file_path
    FileStorageHelpers.clear_screen
    puts 'Enter full file path '
    gets.chomp
  end

  def self.prepare_storage
    exists = Dir.exist?("./#{STORAGE_DIRECTORY_NAME}")
    Dir.mkdir(STORAGE_DIRECTORY_NAME.to_s) unless exists
  end

  def self.handle_storage(path)
    return file_does_not_exist(path) unless path_valid?(path)
    filename = file_basename(path)
    copy_file(path, FileStorageHelpers.storage_path)

    sleep 1

    unless FileStorageHelpers.verify_file_in_store(filename)
      puts "#{filename} was not copied successfully, try again"
    end

    FileStorageHelpers.clear_screen
    puts "#{filename} copied successfully"
  end

  def self.copy_file(path, storage_path)
    FileUtils.copy(path, storage_path)
  end

  def self.file_does_not_exist(path)
    FileStorageHelpers.clear_screen
    puts "The path you specified(#{path}) is not valid, ensure you have the correct filename and path, you can alternatively copy full file path"
  end

  def self.path_valid?(path)
    File.exist?(path)
  end

  def self.file_basename(path)
    File.basename(path)
  end
end
