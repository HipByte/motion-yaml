describe "Scalars" do

#   it "In literals, newlines are preserved" do
#     obj = YAML.load(<<END)
# # ASCII Art
# --- |
#   \//||\/||
#   // ||  ||__
# END
#     obj.should == "//||/||\n// ||  ||__\n"
#   end

#   it "In the plain scalar, newlines become spaces" do
#     obj = YAML.load(<<END)
# ---
#   Mark McGwire's
#   year was crippled
#   by a knee injury.
# END
#     obj.should == "Mark McGwire's year was crippled by a knee injury."
#   end

#   it "Folded newlines are preserved for 'more indented' and blank lines" do
#     obj = YAML.load(<<END)
# >
#  Sammy Sosa completed another
#  fine season with great stats.

#    63 Home Runs
#    0.288 Batting Average

#  What a year!
# END
#     obj.should == "Sammy Sosa completed another fine season with great stats.\n\n  63 Home Runs\n  0.288 Batting Average\n\nWhat a year!\n"
#   end

  it "Indentation determines scope" do
    obj = YAML.load(<<END)
name: Mark McGwire
accomplishment: >
  Mark set a major league
  home run record in 1998.
stats: |
  65 Home Runs
  0.278 Batting Average
END
    obj.should == {"name"=>"Mark McGwire", "accomplishment"=>"Mark set a major league home run record in 1998.\n", "stats"=>"65 Home Runs\n0.278 Batting Average\n"}
  end

#   it "Quoted Scalars" do
#     obj = YAML.load(<<END)
# unicode: "Sosa did fine.\u263A"
# control: "\b1998\t1999\t2000\n"
# hexesc:  "\x13\x10 is \r\n"

# single: '"Howdy!" he cried.'
# quoted: ' # not a ''comment''.'
# tie-fighter: '|\-*-/|'
# END
#   end

  it "Multi-line Flow Scalars" do
    obj = YAML.load(<<END)
plain:
  This unquoted scalar
  spans many lines.

quoted: "So does this
  quoted scalar.\n"
END
    obj.should == {"plain"=>"This unquoted scalar spans many lines.", "quoted"=>"So does this quoted scalar. "}
  end

end