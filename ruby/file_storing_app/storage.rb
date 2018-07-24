require_relative './constants'

class Storage
  def self.target_file_path
    puts 'Enter full file path '
    gets.chomp
  end

  def self.prepare_storage
    exists = Dir.exist?("./#{STORAGE_DIRECTORY}")
    Dir.mkdir(STORAGE_DIRECTORY.to_s) unless exists
  end

  def self.handle_storage(path)
    return file_does_not_exist(path) unless path_valid?(path)
    filename = file_basename(path)
    copy_file(path, storage_path)

    sleep 1

    unless verify_file_in_store(filename)
      puts "#{filename} was not copied successfully, try again"
    end

    puts "#{filename} copied successfully"
  end

  def self.copy_file(path, storage_path)
    FileUtils.copy(path, storage_path)
  end

  def self.file_does_not_exist(path)
    puts "The path you specified(#{path}) is not valid, ensure you have the correct filename and path, you can alternatively copy full file path"
  end

  def self.path_valid?(path)
    File.exist?(path)
  end

  def self.file_basename(path)
    File.basename(path)
  end

  def self.verify_file_in_store(filename)
    File.exist?("#{STORAGE_DIRECTORY}/#{filename}")
  end

  def self.storage_path
    File.absolute_path(STORAGE_DIRECTORY.to_s)
  end
end
