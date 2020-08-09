
class DNA
  
  attr_accessor :first_strand, :first_size
  def initialize(strand)
    @first_strand = strand.chars
    @first_size = @first_strand.size
  end

  def hamming_distance(new_strand)
    new_strand = new_strand.chars
    return 0 if first_size == 0 && new_strand.size == 0
    
    new_size = new_strand.size < first_size ? new_strand.size : first_size
    end_index = new_size - 1
    counter = 0
    first_strand[..end_index].zip(new_strand[..end_index]) do |ch1, ch2|
      counter += 1 unless ch1 == ch2 
    end
    counter 
  end

end


## Top Solution
# class DNA
#   def initialize(strand)
#     @strand = strand
#   end

#   def hamming_distance(strand_2)
#     strand_1 = @strand[0, strand_2.length]

#     strand_1.chars.zip(strand_2.chars).count { |pair| pair.first != pair.last }
#   end
# end


