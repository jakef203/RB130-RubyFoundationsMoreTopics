
def format_date1(date) # This must match
  date.gsub(/\A(\d{4})([\-\/])(\d\d)\2(\d\d)\z/, '\4.\3.\1')
end

p format_date1('2016-06-17') # -> '17.06.2016'
p format_date1('2017/05/03') # -> '03.05.2017'
p format_date1('2015/01-31') # -> '2015/01-31' (no change)

def format_date2(date)
  date.gsub(/\A(\d{4})([\-\/])(\d\d)([\-\/])(\d\d)\z/, '\5.\3.\1')
end

p format_date2('2016-06-17') # -> '17.06.2016'
p format_date2('2017/05/03') # -> '03.05.2017'
p format_date2('2015/01-31') # -> '31.01.2015' 