describe "Structures" do

  it "Two Documents in a Stream" do
    obj = YAML.load(<<END)
# Ranking of 1998 home runs
---
- Mark McGwire
- Sammy Sosa
- Ken Griffey
END
    obj.should == ["Mark McGwire", "Sammy Sosa", "Ken Griffey"]
  end

  it "Play by Play Feed" do
    obj = YAML.load(<<END)
---
time: 20:03:20
player: Sammy Sosa
action: strike (miss)
...
END
    obj.should == {"time"=>72200, "player"=>"Sammy Sosa", "action"=>"strike (miss)"}
  end

  it "Single Document with Two Comments" do
    obj = YAML.load(<<END)
---
hr: # 1998 hr ranking
  - Mark McGwire
  - Sammy Sosa
rbi:
  # 1998 rbi ranking
  - Sammy Sosa
  - Ken Griffey
END
    obj.should == {"hr"=>["Mark McGwire", "Sammy Sosa"], "rbi"=>["Sammy Sosa", "Ken Griffey"]}
  end

  it " Node for 'Sammy Sosa' appears twice in this document" do
    obj = YAML.load(<<END)
---
hr:
  - Mark McGwire
  # Following node labeled SS
  - &SS Sammy Sosa
rbi:
  - *SS # Subsequent occurrence
  - Ken Griffey
END
    obj.should == {"hr"=>["Mark McGwire", "Sammy Sosa"], "rbi"=>["Sammy Sosa", "Ken Griffey"]}
  end

#   it "Mapping between Sequences" do
#     obj = YAML.load(<<END)
# ? - Detroit Tigers
#   - Chicago cubs
# :
#   - 2001-07-23

# ? [ New York Yankees,
#     Atlanta Braves ]
# : [ 2001-07-02, 2001-08-12,
#     2001-08-14 ]
# END
#   end

  it "In-Line Nested Mapping" do
    obj = YAML.load(<<END)
---
# products purchased
- item    : Super Hoop
  quantity: 1
- item    : Basketball
  quantity: 4
- item    : Big Shoes
  quantity: 1
END
    obj.should == [{"item"=>"Super Hoop", "quantity"=>1}, {"item"=>"Basketball", "quantity"=>4}, {"item"=>"Big Shoes", "quantity"=>1}]
  end

end
