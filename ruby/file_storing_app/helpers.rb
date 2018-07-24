require_relative './constants'

module FileStorageHelpers
  def self.verify_file_in_store(filename)
    File.exist?("#{STORAGE_DIRECTORY}/#{filename}")
  end

  def self.storage_path
    File.absolute_path(STORAGE_DIRECTORY.to_s)
  end
end
