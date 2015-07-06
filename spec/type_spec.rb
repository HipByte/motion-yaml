describe "Decimal" do

  it "should be converted to Fixnum object" do
    obj = YAML.load(<<END)
decimal1:  123
float1:    0.5
END
    obj.should == {"decimal1"=>123, "float1"=>0.5}
  end

end

describe "Octal" do

  it "should be converted to Fixnum object" do
    obj = YAML.load("octal: 0644")
    obj.should == {"octal"=>420}
  end

end

describe "Hex" do

  it "should be converted to Fixnum object" do
    obj = YAML.load("hex: 0xff")
    obj.should == {"hex"=>255}

    obj = YAML.load("hex: 0xBEEF")
    obj.should == {"hex"=>48879}

    obj = YAML.load("hex: xBEEF")
    obj.should == {"hex"=>"xBEEF"}
  end

end
