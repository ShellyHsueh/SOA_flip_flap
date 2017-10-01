# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    
    lines = tsv.split("\n")
    keys = lines[0].split("\t")
    keys.map! { |key| key.chomp }
    
    lines.shift
    lines.each { |line|
      value = line.split("\t")
      record = Hash.new
      keys.each_index { |i| record[keys[i]] = value[i] }
      
      @data.push(record)
    }
    @data
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    File.open(tsv_filename, 'w') do |file|
      file.puts @data
      yaml_file.each { |record|
        record.each_value { |value| file.push(value + "\t") }
        file << "\n"
      }
    end
    file
  end
end
