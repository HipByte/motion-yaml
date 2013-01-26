describe "Hash Object" do

  before do
    @hash = { 'a' => 'b' }
  end

  it "should be dumped" do
    YAML.load(YAML.dump(@hash)).should == @hash
  end

end
