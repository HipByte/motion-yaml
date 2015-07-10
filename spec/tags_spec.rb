describe "Scalars" do

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