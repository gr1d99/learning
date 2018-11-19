require_relative './../../The-Odin-Project/caesar_cipher'

Given('plain message {string} with shift factor of {string}') do |message, shift_factor|
  @message = message
  @shift_factor = shift_factor.to_i
end

When('I provide plain message to script') do
  @ciphered_msg = CaesarCipher.cipher(@message, @shift_factor)
end

Then('It should return encrypted{string}') do |ciphered_message|
  expect(@ciphered_msg).to eq(ciphered_message)
end


Given('encrypted message {string} with shift factor of {string}') do |encryped_message, shift_factor|
  @encryped_message = encryped_message
  @shift_factor = shift_factor.to_i
end

When('I provide encrypted message to script') do
  @plain_message = CaesarCipher.decipher(@encryped_message, @shift_factor)
end

Then('It should return plain message {string}') do |plain_message|
  expect(@plain_message).to eq(plain_message)
end

Then('It should not return readable plain message {string}') do |output|
  p @plain_message
  expect(@plain_message).not_to eq(output)
end
