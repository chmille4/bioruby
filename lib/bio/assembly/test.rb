











class Assembly
  
  def initialize(path)
    @file = File.new(path, 'r')
    @a = [ 1, 2, 3, 4, 5]
    
    @contigs = Array.new
    parse
  end
  
  def each_contig  
    contig = parse_contig  
    yield(contig)
  end
  
  def each_test
    @a.each do |a|
      yield(a)
    end
  end
  
  private
  
  def parse_contig
    file.each do |line|
      # search for next contig
      next unless line.match(/^CO\s/)
      
      identifier, name, base_num, read_num, base_segments_num, orientation = line.split(" ")
      contig = Contig.new(name)
      contig.parse(@file)
      
      return contig
    end
  end
  
end

class Contig
  
  def initialize(name)
    @name = name
    @reads
    @number_of_bases # should i keep track of this?
    @orientation
    @consensus_sequence # change to just sequence?
    @quality
    @start_pos
    @stop_pos
  end
  
  def parse(file)
    # keep track of previous line position in stream
    pos = file.post
    
    file.each do |line|
      break if line.match(/^CO\s/)
      
      pos = file.post
    end
  end
end

class read
  def initialize
    @sequence
    @start_clear
    @stop_clear
    @start # padded start consensus position
  end
end