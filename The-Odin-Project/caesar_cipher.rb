class CaesarCipher
  attr_reader :message,
              :shift_factor,
              :case_options,
              :message_list,
              :ciphered_message

  def initialize(message, shift_factor)
    @message = message
    @shift_factor = shift_factor
    @case_options = { upper: [] }
    @message_list = []
    @ciphered_message = @message.clone
  end

  def cipher
    start(setup_metadata)
  end

  def decipher
    start(setup_metadata, false)
  end

  def self.cipher(message, shift_factor)
    new(message, shift_factor).cipher
  end

  def self.decipher(message, shift_factor)
    new(message, shift_factor).decipher
  end

  private

  def build_message_list
    message.size.times do |index|
      message_list << message[index]
    end
    message_list
  end

  def alphabetical_letters
    hash = []
    ('a'..'z').map { |letter| hash.push(letter) }
    hash
  end

  def cipher_board
    board = []
    alphabetical_letters.each_with_index do |letter, index|
      board << { "#{letter}": (index + 1) }
    end
    board
  end

  def setup_metadata
    result = {}
    message.size.times do |index|
      build_index_and_position(result, message, index)
      setup_case_options(message[index], index)
    end
    result
  end

  def build_index_and_position(result, message, index)
    letter_data = result[message[index]]
    if letter_data
      letter_data[:indexes] << index
      letter_data[:position] = letter_position(message[index])
    else
      result[message[index]] = { indexes: [index],
                                 position: letter_position(message[index])}
    end
    result
  end

  def setup_case_options(letter, index)
    case_options[:upper] << index if upcase?(letter)
  end

  def letter_position(letter)
    letter = letter.downcase.to_sym
    position = nil
    cipher_board.each do |hash|
      position = hash[letter]
      break if position
    end
    position
  end

  def start(message_hash, cipher = true)
    new_hash = apply_shift_factor(message_hash, cipher)
    create_ciphered_message(new_hash)
    restore_cases
  end

  def apply_shift_factor(message_hash, cipher)
    new_hash = {}
    message_hash.each do |letter, metadata|
      position = setup_position(metadata[:position], cipher)
      letter = fetch_letter_by_position(position) if position
      new_hash[letter] = metadata
    end
    new_hash
  end

  def setup_position(position, cipher)
    position = new_position(position, cipher)
    position = ensure_valid_position(position) if position
    position
  end

  def new_position(position, cipher)
    new_shift_factor = sanitized_shift_factor
    if cipher
      position += new_shift_factor if position
    else
      position -= new_shift_factor if position
    end
    position
  end

  def sanitized_shift_factor
    cipher_board_len = cipher_board.size
    if shift_factor > cipher_board_len
      diff = shift_factor / cipher_board_len
      return shift_factor - cipher_board_len if diff == 1

      return shift_factor - (cipher_board_len * diff)
    end
    shift_factor
  end

  def create_ciphered_message(ciphered_hash)
    ciphered_hash.each do |letter, metadata|
      letter = letter.to_s
      metadata[:indexes].each do |index|
        ciphered_message[index] = letter
      end
    end
    ciphered_message
  end

  def restore_cases
    case_options[:upper].each do |index|
      letter = ciphered_message[index]
      if string?(letter)
        ciphered_message[index] = ciphered_message[index].upcase
      end
    end
    ciphered_message
  end

  def ensure_valid_position(position)
    position += 26 if position.negative?
    position -= 26 if position > 26
    position
  end

  def fetch_letter_by_position(position)
    letter = nil
    cipher_board.each do |hash|
      match = position.equal?(hash.values[0])
      letter = hash.keys[0] if match
      break if match
    end
    letter
  end

  def upcase?(value)
    return value.upcase == value if string?(value)

    false
  end

  def string?(value)
    match = value =~ /^[a-zA-Z]+$/
    return false if match.nil?

    true
  end
end
