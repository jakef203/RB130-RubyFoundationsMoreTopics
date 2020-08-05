Q1
def url?(website)
  website.match?(/\Ahttps?:\/\/\S+\z/)  # Can also use !!website.match(...)
end

p url?('http://launchschool.com')   # -> true
p url?('https://example.com')       # -> true
p url?('https://example.com hello') # -> false
p url?('   https://example.com')    # -> false