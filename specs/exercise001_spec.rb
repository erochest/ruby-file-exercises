
describe "exercise-001.rb" do
  describe "output" do
    it "should write the words from jabberwocky.txt to the screen, one per line." do
      output = `ruby exercise-001.rb`
      lines = output.lines
      lines.count.should == 167
      lines.each { |line| (/\s/ =~ line.rstrip).should == nil }
    end
  end
end

# vim: set filetype=ruby.rspec:
