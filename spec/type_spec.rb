describe "Type Converting" do

  describe "Decimal" do
    it "should be converted to Fixnum object" do
      obj = YAML.load("decimal: 123")
      obj.should == {"decimal"=>123}
    end
  end

  describe "Float" do
    it "should be converted to Float object" do
      obj = YAML.load("float: 123.5")
      obj.should == {"float"=>123.5}

      obj = YAML.load("float: .123")
      obj.should == {"float"=>0.123}

      obj = YAML.load("float: 123.5.6")
      obj.should == {"float"=>"123.5.6"}
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

      obj = YAML.load("hex: 0x9Ac")
      obj.should == {"hex"=>2476}

      obj = YAML.load("hex: 0xBEEF")
      obj.should == {"hex"=>48879}

      obj = YAML.load("hex: 0xxBEEF")
      obj.should == {"hex"=>"0xxBEEF"}

      obj = YAML.load("hex: xBEEF")
      obj.should == {"hex"=>"xBEEF"}
    end
  end
end