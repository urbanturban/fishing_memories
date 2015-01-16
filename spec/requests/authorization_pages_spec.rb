require 'spec_helper'

describe "authorization" do

  describe "memories" do
    it_should_behave_like "resource with authorization pages" do
      let(:resource_class) { Memory }
    end
  end

  describe "tackles" do
    it_should_behave_like "resource with authorization pages" do
      let(:resource_class) { Tackle }
    end
  end

  describe "ponds" do
    it_should_behave_like "resource with authorization pages" do
      let(:resource_class) { Pond }
    end
  end
  
end