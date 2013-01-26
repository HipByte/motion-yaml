describe "Boolean" do

  it "True should be loaded as object" do
    boolean = { 'boolean' => true }
    %w{ yes Yes YES true True TRUE on On ON }.each do |truth|
      YAML.load("boolean: #{truth}").should == boolean
    end
  end

  it "False should be loaded as object" do
    boolean = { 'boolean' => false }
    %w{ no No NO false False FALSE off Off OFF }.each do |truth|
      YAML.load("boolean: #{truth}").should == boolean
    end
  end

end
