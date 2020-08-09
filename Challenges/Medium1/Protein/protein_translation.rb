
class InvalidCodonError < StandardError; end

class Translation
  def self.of_codon(codon)
    case codon
    when "AUG" then "Methionine"
    when "UUU", "UUC" then "Phenylalanine"
    when "UUA", "UUG" then "Leucine"
    when "UCU", "UCC", "UCA", "UCG" then "Serine"
    when "UAU", "UAC" then "Tyrosine"
    when "UGU", "UGC" then "Cysteine"
    when "UGG" then "Tryptophan"
    when "UAA", "UAG", "UGA" then "STOP"
    else     raise InvalidCodonError
    end
  end

  def self.of_rna(strand)
    protein_array = []
    while strand.size > 0 
      next_protein = of_codon(strand.slice!(0, 3))
      break if next_protein == "STOP"
      protein_array << next_protein
    end
    protein_array
  end
end

## Solution 1
# class InvalidCodonError < StandardError
# end
# #
# module Translation
#   CODON_PROTEIN = {
#     'AUG' => 'Methionine',    'UUU' => 'Phenylalanine',
#     'UUC' => 'Phenylalanine', 'UUA' => 'Leucine',
#     'UUG' => 'Leucine',       'UCU' => 'Serine',
#     'UCC' => 'Serine',        'UCA' => 'Serine',
#     'UCG' => 'Serine',        'UAU' => 'Tyrosine',
#     'UAC' => 'Tyrosine',      'UGU' => 'Cystine',
#     'UGC' => 'Cystine',       'UGG' => 'Tryptophan',
#     'UAA' => 'STOP',          'UAG' => 'STOP',
#     'UGA' => 'STOP'
#   }

#   def self.of_codon(codon)
#     CODON_PROTEIN.fetch(codon) { fail InvalidCodonError }
#   end

#   def self.of_rna(strand)
#     strand.scan(/.../).take_while { |codon| of_codon(codon) != 'STOP' }
#                       .map { |codon| of_codon(codon) }
#   end
# end




