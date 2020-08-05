
# def format_date(date)
#   date.gsub(/\A(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})\z/, 'k<year>')

# end

# p format_date('2016-06-17') # -> '17.06.2016'
# p format_date('2016/06/17') # -> '2016/06/17' (no change)

# def format_date(date)

#   (/\A(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})\z/) =~ date
#   "#{day}.#{month}.#{year}"
# end

# p format_date('2016-06-17') # -> '17.06.2016'
# format_date('2016/06/17') # -> '2016/06/17' (no change)

# p /\A(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})\z/.match('2016-06-17')

/\A\$(?<dollars>\d+)\.(?<cents>\d{2})\z/ =~ "$504.36"
p "$#{dollars}.#{cents}"


  