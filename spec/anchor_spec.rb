describe "Anchor" do
  it "should be supported in scalar" do
    obj = YAML.load(<<END)
- &mark foo
- bar
- *mark
- *mark
END
    obj.should == ["foo", "bar", "foo", "foo"]
  end

  it "should be supported in mapping" do
    obj = YAML.load(<<END)
test_anchor_map: &map_test
  a: 1
  b: 2
test_alias_map: *map_test
END
    obj.should == {"test_anchor_map"=>{"a"=>1, "b"=>2}, "test_alias_map"=>{"a"=>1, "b"=>2}}
  end

  it "should be supported in sequence" do
    obj = YAML.load(<<END)
test_anchor_sequence: &sequence_test
  - a
  - b
test_alias_sequence: *sequence_test
END
    obj.should == {"test_anchor_sequence"=>["a", "b"], "test_alias_sequence"=>["a", "b"]}

    obj = YAML.load(<<END)
sequence_with_anchor_and_alias:
  - 'hello'
  - &test_inside_sequence 'test'
  - *test_inside_sequence
  - 'goodbye'
END
    obj.should == {"sequence_with_anchor_and_alias"=>["hello", "test", "test", "goodbye"]}
  end
end