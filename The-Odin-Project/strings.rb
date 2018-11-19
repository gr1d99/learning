# sub - replaces a single occurrence
# ----------------------------------
str1 = 'my my string'
p "sub() #{str1.sub('my', 'our')}"

# gsub - replace all occurrences
p "gsub() #{str1.gsub('my', 'simple')}"

