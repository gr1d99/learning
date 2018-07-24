require_relative './constants'
require_relative './helpers'

class FileList
  include FileStorageHelpers

  def self.handle_listing
    FileStorageHelpers.clear_screen
    count_files
    list_files
  end

  def self.list_files
    entries.each_with_index do |file, index|
      puts "#{index + 1} - #{file}"
    end
  end

  def self.count_files
    total = entries.size
    puts "You have #{total} files in storage"
  end

  def self.entries
    all_entries = Dir.entries(FileStorageHelpers.storage_path)
    all_entries.reject! { |entry| entry if USELESS_ENTRIES.include?(entry) }
  end
end
