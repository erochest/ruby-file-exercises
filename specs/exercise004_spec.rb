
describe "exercise-004.rb" do
  describe "output" do
    before(:each) do
      output = `ruby exercise-004.rb`
      @lines = output.lines
    end

    it "should write one line for each token type in jabberwocky.txt" do
      @lines.count.should == 90
    end

    it "should not include empty words." do
      # Just use the same regex as last time, but use +, not *.
      @lines.each { |line| (/^'[a-z]+'\t\d+\n$/ =~ line).should == 0 }
    end
  end
end

# vim: set filetype=ruby.rspec:
