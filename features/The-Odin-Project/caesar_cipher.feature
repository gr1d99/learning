Feature: Caesar Cipher
  Secure messages from spies

  Scenario Outline: Encrypting message
    Given plain message "<plain_message>" with shift factor of "<shift_factor>"
    When I provide plain message to script
    Then It should return encrypted"<ciphered_message>"

  Examples:
    |plain_message    |shift_factor|ciphered_message |
    |A simple Question|10          |K cswzvo Aeocdsyx|

  Scenario Outline: Decrypting message
    Given encrypted message "<ciphered_message>" with shift factor of "<shift_factor>"
    When I provide encrypted message to script
    Then It should return plain message "<plain_message>"

  Examples:
    |ciphered_message |shift_factor|plain_message    |
    |K cswzvo Aeocdsyx|10          |A simple Question|

  Scenario Outline: Decrypting message with incorrect key
    Given encrypted message "<ciphered_message>" with shift factor of "<shift_factor>"
    When I provide encrypted message to script
    Then It should not return readable plain message "<plain_message>"

    Examples:
      |ciphered_message |shift_factor|plain_message    |
      |K cswzvo Aeocdsyx|9           |A simple Question|
