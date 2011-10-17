
describe "exercise-009.rb" do
  # Moving everything to functions shouldn't change any functionality. These
  # are the same tests as last time. But refactored.

  before(:each) do
    FileUtils.rm('jabberwocky-counts.txt') if File.exists?('jabberwocky-counts.txt')
    system('ruby exercise-009.rb')
    @lines = File.open('jabberwocky-counts.txt') do |f|
      f.lines.to_a
    end
  end

  describe "frequency output" do

    # These just test that the contents of jabberwocky-counts.txt (read in
    # before(:each)) pass the last test for output written to the screen.

    it "should write one line for each token type in jabberwocky.txt and one for the type/token ratio" do
      @lines.should have(91).items
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

  # The only difference in this script is that it also outputs the type/token
  # ratio. We'll include a couple of tests for that.
  describe "type/token ratio output" do
    # First, test that it was output.
    it "was added as the last line." do
      @lines[-1].should be_start_with('Type/token ratio: ')
    end

    # Second, make sure that it is non-zero.
    it "is non-zero (an insufficient sanity check)." do
      @lines[-1].split[-1].to_f.should_not == 0.0
    end
  end
end

# vim: set filetype=ruby.rspec:
