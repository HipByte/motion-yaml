describe "#to_yaml" do

  before do
    @list = [{ 'a' => 'b' }, 'foo', 'No', 'yeS']
  end

  it "should work" do
    @list.to_yaml.should == YAML.dump(@list)
    YAML.load(@list.to_yaml).should == @list
  end

  it "should dump quoted string if string will be converted with #load method" do
    @list.to_yaml.should == "- a: b\n- foo\n- 'No'\n- 'yeS'\n"
  end

end