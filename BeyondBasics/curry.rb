compatible_part = lambda do |car, part|
  false
end

subaru = compatible_part.curry['subaru']
parts = [1, 2, 3]
p parts.map(&:subaru)
