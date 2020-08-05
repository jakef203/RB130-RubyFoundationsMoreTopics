## Their solution
class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }

## my original solution, process is really ugly
# class TextAnalyzer
#   @file = nil
#   def process
#     @file = File.open('./sample_text.txt', 'r')
#     @text = @file.read
#     output_type = yield
#     case output_type
#     when 'paragraphs'
#       number_paragraphs = @text.split("\n\n").count
#       puts "#{number_paragraphs} paragraphs"
#       @file.close
#     when 'lines'
#       number_lines = @text.split("\n").count
#       puts "#{number_lines} lines"
#       @file.close
#     when 'words'
#       number_words = @text.split(/\s+/).count
#       puts "#{number_words} words"
#       @file.close
#     end
#   end
# end

# analyzer = TextAnalyzer.new 
# analyzer.process { "paragraphs" }
# analyzer.process { "lines" }
# analyzer.process { "words" }


# file = File.open('./sample_text.txt', 'r')
# text = file.read
# arr = text.split(' ')
# p arr
# p arr.count