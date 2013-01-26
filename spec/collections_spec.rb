describe "Collections" do

  it "Sequence of Scalars" do
    obj = YAML.load(<<END)
- Mark McGwire
- Sammy Sosa
- Ken Griffey
END
    obj.should == ["Mark McGwire", "Sammy Sosa", "Ken Griffey"]
  end

  it "Mapping Scalars to Scalars" do
    obj = YAML.load(<<END)
hr:  65    # Home runs
avg: 1.0   # Batting average
rbi: 147   # Runs Batted In
END
    obj.should == {"hr"=>65, "avg"=>1.0, "rbi"=>147}
  end

  it "Mapping Scalars to Sequences" do
    obj = YAML.load(<<END)
american:
  - Boston Red Sox
  - Detroit Tigers
  - New York Yankees
national:
  - New York Mets
  - Chicago Cubs
  - Atlanta Braves
END
    obj.should == {"american"=>["Boston Red Sox", "Detroit Tigers", "New York Yankees"], "national"=>["New York Mets", "Chicago Cubs", "Atlanta Braves"]}
  end

  it "Sequence of Mappings" do
    obj = YAML.load(<<END)
-
  name: Mark McGwire
  hr:   65
  avg:  1.0
-
  name: Sammy Sosa
  hr:   63
  avg:  3.0
END
    obj.should == [{"name"=>"Mark McGwire", "hr"=>65, "avg"=>1.0}, {"name"=>"Sammy Sosa", "hr"=>63, "avg"=>3.0}]
  end

  it "Sequence of Sequences" do
    obj = YAML.load(<<END)
- [name        , hr, avg  ]
- [Mark McGwire, 65, 1.0]
- [Sammy Sosa  , 63, 3.0]
END
    obj.should == [["name", "hr", "avg"], ["Mark McGwire", 65, 1.0], ["Sammy Sosa", 63, 3.0]]
  end

  it "Mapping of Mappings" do
    obj = YAML.load(<<END)
Mark McGwire: {hr: 65, avg: 1.0}
Sammy Sosa: {
    hr: 63,
    avg: 3.0
  }
END
    obj.should == {"Mark McGwire"=>{"hr"=>65, "avg"=>1.0}, "Sammy Sosa"=>{"hr"=>63, "avg"=>3.0}}
  end

end
