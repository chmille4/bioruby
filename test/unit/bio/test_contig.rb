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
  class TestAssemblyACE < Test::Unit::TestCase

    def setup
      test_data_path = Pathname.new(File.join(BioRubyTestDataPath, 'ace')).cleanpath.to_s
      ace_filename = File.join(test_data_path, 'example1.ace')
      @obj = Bio::Assembly.new(ace_filename)
      
      # pick a contig to do in depth tests on
      @contig = nil
      @obj.each_contig { |c| @contig = c if c.name.to_i == 5 }
    end
    
    def test_find_reads_in_range
      
    end    
    
  end
  
end