
describe "exercise-002.rb" do
  describe "output" do
    before(:each) do
      output = `ruby exercise-002.rb`
      @lines = output.lines
    end

    it "should read and output the words from jabberwocky.txt." do
      @lines.count.should == 167
      @lines.to_a[0, 6].join().should == "twas\nbrillig\nand\nthe\nslithy\ntoves\n"
    end

    it "should output the words one per line, and remove non word characters." do
      @lines.each { |line| (/\W/ =~ line.rstrip).should == nil }
    end

    it "should convert all words to lower-case." do
      @lines.each { |line| (/[A-Z]/ =~ line).should == nil }
    end
  end
end

# vim: set filetype=ruby.rspec:
