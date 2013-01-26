describe "Array object" do

  before do
    @list = [{ 'a' => 'b' }, 'foo']
  end

  it "should be dumped" do
    YAML.dump(@list).should == "- a: b\n- foo\n"
    YAML.load(YAML.dump(@list)).should == @list
  end

end