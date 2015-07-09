describe "Type Converting" do

  describe "Decimal" do
    it "should be converted to Fixnum object" do
      obj = YAML.load("decimal: 123")
      obj.should == {"decimal"=>123}

      obj = YAML.load("decimal: +123")
      obj.should == {"decimal"=>+123}

      obj = YAML.load("decimal: -123")
      obj.should == {"decimal"=>-123}
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

      obj = YAML.load("float: .inf")
      obj.should == {"float"=>Float::INFINITY}
      obj = YAML.load("float: +.inf")
      obj.should == {"float"=>Float::INFINITY}
      obj = YAML.load("float: -.inf")
      obj.should == {"float"=>-Float::INFINITY}

      obj = YAML.load("float: .nan")
      obj.should == {"float"=>Float::NAN}
    end
  end

  describe "Binary" do
    it "should be converted to Fixnum object" do
      obj = YAML.load("binary: 0b1010")
      obj.should == {"binary"=>10}

      obj = YAML.load("binary: +0b1010")
      obj.should == {"binary"=>10}

      obj = YAML.load("binary: -0b1010")
      obj.should == {"binary"=>-10}
    end
  end

  describe "Octal" do
    it "should be converted to Fixnum object" do
      obj = YAML.load("octal: 0644")
      obj.should == {"octal"=>420}

      obj = YAML.load("octal: +0644")
      obj.should == {"octal"=>420}

      obj = YAML.load("octal: -0644")
      obj.should == {"octal"=>-420}
    end
  end

  describe "Hex" do
    it "should be converted to Fixnum object" do
      obj = YAML.load("hex: 0xff")
      obj.should == {"hex"=>255}

      obj = YAML.load("hex: +0xff")
      obj.should == {"hex"=>255}

      obj = YAML.load("hex: -0xff")
      obj.should == {"hex"=>-255}

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

  describe "Boolean" do
    it "should be converted to True/False object" do
      obj = YAML.load('boolean: true')
      obj.should == {"boolean"=>true}

      obj = YAML.load('boolean: y')
      obj.should == {"boolean"=>true}

      obj = YAML.load('boolean: yes')
      obj.should == {"boolean"=>true}

      obj = YAML.load('boolean: on')
      obj.should == {"boolean"=>true}

      obj = YAML.load('boolean: false')
      obj.should == {"boolean"=>false}

      obj = YAML.load('boolean: n')
      obj.should == {"boolean"=>false}

      obj = YAML.load('boolean: no')
      obj.should == {"boolean"=>false}

      obj = YAML.load('boolean: off')
      obj.should == {"boolean"=>false}
    end
  end

  describe "Null" do
    it "should be converted to True/False object" do
      obj = YAML.load('foo: ~')
      obj.should == {"foo"=>nil}
    end
  end

  describe "Symbol" do
    it "should be converted to Symbol object" do
      obj = YAML.load(':foo: 123')
      obj.should == {:foo=>123}
      obj = YAML.load(':"foo": 123')
      obj.should == {:foo=>123}

      str = YAML.dump({:foo => 123})
      str.should == ":foo: 123\n"
    end
  end
end