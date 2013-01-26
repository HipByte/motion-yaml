describe "Scalars" do

#   it "Integers" do
#     obj = YAML.load(<<END)
# canonical: 12345
# decimal: +12,345
# sexagesimal: 3:25:45
# octal: 014
# hexadecimal: 0xC
# END
#     obj.should == {"canonical"=>12345, "decimal"=>12345, "sexagesimal"=>12345, "octal"=>12, "hexadecimal"=>12}
#   end

#   it "Floating Point" do
#     obj = YAML.load(<<END)
# canonical: 1.23015e+3
# exponential: 12.3015e+02
# sexagesimal: 20:30.15
# fixed: 1,230.15
# negative infinity: -.inf
# not a number: .NaN
# END
#   end

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

#   it "Various Explicit Tags" do
#     obj = YAML.load(<<END)
# ---
# not-date: !!str 2002-04-28

# picture: !!binary |
#  R0lGODlhDAAMAIQAAP//9/X
#  17unp5WZmZgAAAOfn515eXv
#  Pz7Y6OjuDg4J+fn5OTk6enp
#  56enmleECcgggoBADs=

# application specific tag: !something |
#  The semantics of the tag
#  above may be different for
#  different documents.
# END
#   end

#   it "Global Tags" do
#     obj = YAML.load(<<END)
# %TAG ! tag:clarkevans.com,2002:
# --- !shape
#   # Use the ! handle for presenting
#   # tag:clarkevans.com,2002:circle
# - !circle
#   center: &ORIGIN {x: 73, y: 129}
#   radius: 7
# - !line
#   start: *ORIGIN
#   finish: { x: 89, y: 102 }
# - !label
#   start: *ORIGIN
#   color: 0xFFEEBB
#   text: Pretty vector drawing.
# END
#   end

#   it "Unordered Sets" do
#     obj = YAML.load(<<END)
# # sets are represented as a
# # mapping where each key is
# # associated with the empty string
# --- !!set
# ? Mark McGwire
# ? Sammy Sosa
# ? Ken Griff
# END
#     obj.should == {"Mark McGwire"=>nil, "Sammy Sosa"=>nil, "Ken Griff"=>nil}
#   end

  it "Ordered Mappings" do
    obj = YAML.load(<<END)
# ordered maps are represented as
# a sequence of mappings, with
# each mapping having one key
--- !!omap
- Mark McGwire: 65
- Sammy Sosa: 63
- Ken Griffy: 58
END
    obj.should == [{"Mark McGwire"=>65}, {"Sammy Sosa"=>63}, {"Ken Griffy"=>58}]
  end

end