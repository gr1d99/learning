require_relative '../../spec/spec_helper'
require_relative '../../The-Odin-Project/caesar_cipher'

RSpec.describe CaesarCipher do
  let(:message) { 'What a string!' }
  let(:shift_factor) { 1000 }
  let(:ciphered_message) { described_class.cipher(message, shift_factor) }

  context 'when string and shift factor are given' do
    it 'ciphers string' do
      expect(ciphered_message).not_to be(message)
      expect(ciphered_message.size).to be(message.size)
    end
  end
  context 'when key is correct' do
    it 'deciphers string with case maintained' do
      deciphered_message = described_class.decipher(
        ciphered_message, shift_factor)
      expect(deciphered_message).to eq(message)
    end
  end
  context 'when key is incorrect' do
    it 'does not decipher string' do
      deciphered_message = described_class.decipher(ciphered_message, 8)
      expect(deciphered_message).not_to eq(message)
    end
  end
end
