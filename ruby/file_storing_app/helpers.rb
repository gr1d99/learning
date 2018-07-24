require_relative './constants'

module FileStorageHelpers
  def self.verify_file_in_store(filename)
    File.exist?("#{STORAGE_DIRECTORY_NAME}/#{filename}")
  end

  def self.storage_path
    File.absolute_path(STORAGE_DIRECTORY_NAME.to_s)
  end

  def self.clear_screen
    Gem.win_platform? ? (system 'cls') : (system 'clear')
  end
end
