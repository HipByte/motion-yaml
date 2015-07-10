describe "Scalars" do

  it "Integers" do
    obj = YAML.load(<<END)
canonical: 12345
decimal: +12,345
sexagesimal: 3:25:45
octal: 014
hexadecimal: 0xC
END
    obj.should == {"canonical"=>12345, "decimal"=>12345, "sexagesimal"=>12345, "octal"=>12, "hexadecimal"=>12}
  end

  it "Floating Point" do
    obj = YAML.load(<<END)
canonical: 1.23015e+3
exponential: 12.3015e+02
sexagesimal: 20:30.15
fixed: 1,230.15
negative infinity: -.inf
not a number: .NaN
END
  obj.should == {
    "canonical"=>1230.15,
    "exponential"=>1230.15,
    "sexagesimal"=>73809.0,
    "fixed"=>1230.15,
    "negative infinity"=>-Float::INFINITY,
    "not a number"=>Float::NAN
  }
  end

  it "Miscellaneous" do
    obj = YAML.load(<<END)
null: ~
true: y
false: n
string: '12345'
END
    obj.should == {"null"=>nil, true=>true, false=>false, "string"=>"12345"}
  end

#   it "Timestamps" do
#     obj = YAML.load(<<END)
# canonical: 2001-12-15T02:59:43.1Z
# iso8601: 2001-12-14t21:59:43.10-05:00
# spaced: 2001-12-14 21:59:43.10 -5
# date: 2002-12-14
# END
#   end

  it "In literals, newlines are preserved" do
    obj = YAML.load(<<END)
# ASCII Art
--- |
  \//||\/||
  // ||  ||__
END
    obj.should == "//||/||\n// ||  ||__\n"
  end

  it "In the plain scalar, newlines become spaces" do
    obj = YAML.load(<<END)
---
  Mark McGwire
  year was crippled
  by a knee injury.
END
    obj.should == "Mark McGwire year was crippled by a knee injury."
  end

  it "Folded newlines are preserved for 'more indented' and blank lines" do
    obj = YAML.load(<<END)
>
 Sammy Sosa completed another
 fine season with great stats.

   63 Home Runs
   0.288 Batting Average

 What a year!
END
    obj.should == "Sammy Sosa completed another fine season with great stats.\n\n  63 Home Runs\n  0.288 Batting Average\n\nWhat a year!\n"
  end

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

  it "Quoted Scalars" do
    obj = YAML.load(<<END)
single: '"Howdy!" he cried.'
quoted: ' # not a ''comment''.'
tie-fighter: '|\-*-/|'
END
    obj.should == {"single"=>"\"Howdy!\" he cried.", "quoted"=>" # not a 'comment'.", "tie-fighter"=>"|-*-/|"}
  end

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