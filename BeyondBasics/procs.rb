apply_prefix = Proc.new do |prefix, word|
  "#{prefix}#{word}"
end

words = %w[wors dfd dtbrv]

words.each do |word|
  p apply_prefix.call('_', word)
end

def each_char(word)
  for i in 0..(word.size - 1)
    yield i
  end
end

each_char('aaaa') do |x|
  p "_#{x}"
end