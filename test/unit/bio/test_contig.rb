#
# = test/unit/bio/test_contig.rb - Unit test for Bio::Assembly::Contig
#
# Copyright::   Copyright (C) 2010
#               Chase Miller <chmille4@gmail.com
# License::     The Ruby License
#
# $Id:$
#

# loading helper routine for testing bioruby
require 'pathname'
load Pathname.new(File.join(File.dirname(__FILE__), ['..'] * 2,
                            'bioruby_test_helper.rb')).cleanpath.to_s

# libraries needed for the tests
require 'test/unit'
require 'bio/assembly'
require 'bio/assembly/contig'

module Bio
  class TestContigACE < Test::Unit::TestCase

    def setup
      test_data_path = Pathname.new(File.join(BioRubyTestDataPath, 'ace')).cleanpath.to_s
      ace_filename = File.join(test_data_path, 'example1.ace')
      @obj = Bio::Assembly.new(ace_filename)
      
      # pick a contig to do in depth tests on
      @contig = nil
      @obj.each_contig { |c| @contig = c if c.name.to_i == 5 }
    end
    
    def test_1
       assert_equal(1,1)
    end
    
    def test_find_reads_in_range
      known_reads = [ '235283518', '235288260', '235293813', '235288255', '235283548' ]
      reads_in_range = @contig.find_reads_in_range(295, 424)
      assert_equal( 5, known_reads.size )
      known_reads.each do |read_name|
        read = Bio::Assembly::Read.new()
        read.name = read_name
        reads_in_range.delete(read)
      end
      assert_equal(0, reads_in_range.size)
    end    
    
  end
  
end