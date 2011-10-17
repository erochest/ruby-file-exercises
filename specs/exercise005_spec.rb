
describe "exercise-005.rb" do
  describe "output" do
    before(:each) do
      output = `ruby exercise-005.rb`
      @lines = output.lines
    end

    it "should write one line for each token type in jabberwocky.txt" do
      @lines.count.should == 90
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
