describe "Decimal" do

  it "should be converted to Fixnum object" do
    obj = YAML.load(<<END)
decimal1:  123
float1:    0.5
END
    obj.should == {"decimal1"=>123, "float1"=>0.5}
  end

end