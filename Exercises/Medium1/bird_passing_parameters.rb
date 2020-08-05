
def newfunc(birds)
  yield(birds)
end

arr = %w(raven finch hawk eagle veloci)

newfunc(arr) { |_, _, *raptors| puts raptors.join(' and ') }


# def fun(one, two, *multiple)
#   p one
#   p two
#   p multiple
# end

# fun('hi', 'there', 'you', 'amazing', 'erson')