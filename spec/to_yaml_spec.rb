describe "#to_yaml" do

  before do
    @list = [{ 'a' => 'b' }, 'foo']
  end

  it "should work" do
    @list.to_yaml.should == YAML.dump(@list)
    YAML.load(@list.to_yaml).should == @list
  end

end