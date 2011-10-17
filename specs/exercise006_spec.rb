
require 'fileutils'

describe "exercise-006" do
  describe "output" do
    before(:each) do
      FileUtils.rm('jabberwocky-counts.txt') if File.exists?('jabberwocky-counts.txt')
      system('ruby exercise-006.rb')
      @lines = File.open('jabberwocky-counts.txt') do |f|
        f.lines.to_a
      end
    end

    # These just test that the contents of jabberwocky-counts.txt (read in
    # before(:each)) pass the last test for output written to the screen.

    it "should write one line for each token type in jabberwocky.txt" do
      @lines.should have(90).items
    end

    it "should sort the output." do
      # First, let's split the tokens and counts, strip out the tokens, and
      # convert the counts to integer.
      counts = @lines.map { |line|   line.split }
                     .map { |fields| fields[1]  }
                     .map { |count|  count.to_i }

      # Now, make sure that each is smaller than the one preceeding it.  Do
      # this by threading the result so far (prev_result) and the previous
      # item (prev_item) through iterating over each count.
      counts.slice(1, counts.count).inject [true, counts[0]] do |prev, current|
        prev_result, prev_item = prev
        [prev_result && prev_item >= current, current]
      end
    end
  end
end

# vim: set filetype=ruby.rspec:
