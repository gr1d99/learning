# Understanding Ruby closures

VOWELS = %w[a e i o u].freeze

def can_work?(word)
  VOWELS.include?(word[-1])
end

def concatenate(string, char)
  string << char
end

pluralizer = proc do |string, char|
  if can_work?(string)
    concatenate(string, char)
  else
    string
  end
end

def pluralize(word, char, &block)
  return word unless block
  yield word, char
end

p pluralize('cow', 's', &pluralizer)
