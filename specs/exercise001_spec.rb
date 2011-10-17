
describe "exercise-001.rb" do
  describe "output" do
    before(:each) do
      output = `ruby exercise-001.rb`
      @lines = output.lines
    end

    it "should write the words from jabberwocky.txt to the screen, one per line." do
      @lines.count.should == 167
      @lines.to_a[0, 6].join().should == "`Twas\nbrillig,\nand\nthe\nslithy\ntoves\n"
    end

    it "should remove whitespace from the words." do
      @lines.each { |line| (/\s/ =~ line.rstrip).should == nil }
    end
  end
end

# vim: set filetype=ruby.rspec:
