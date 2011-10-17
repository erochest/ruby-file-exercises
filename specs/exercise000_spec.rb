#!/usr/bin/env ruby

describe "exercise-000.rb" do
  describe "output" do
    it "should write the lines of jabberwocky.txt to the screen." do
      output = `ruby exercise-000.rb`
      lines = output.lines
      lines.count.should == 30
    end
  end
end

# vim: set filetype=ruby.rspec:
