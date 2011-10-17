
describe "exercise-003.rb" do
  describe "output" do
    before(:each) do
      output = `ruby exercise-003.rb`
      @lines = output.lines
    end

    it "should write one line for each token type in jabberwocky.txt" do
      @lines.count.should == 91
    end
    
    it "should write each type and its frequency." do
      @lines.each { |line| (/^'[a-z]*'\t\d+\n$/ =~ line).should == 0 }
    end

    it "should compute the frequencies correctly." do
      # Just picked a few at random.
      @lines.detect { |line| line == "'the'\t19\n" }.should_not be_nil
      @lines.detect { |line| line == "'jabberwock'\t3\n" }.should_not be_nil
      @lines.detect { |line| line == "'whiffling'\t1\n" }.should_not be_nil
    end
  end
end

# vim: set filetype=ruby.rspec:
