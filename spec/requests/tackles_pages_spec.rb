require 'spec_helper'
require 'user_helper'

describe "TacklesPages" do
	it_should_behave_like "resource pages" do
	  let(:resource_class) { Tackle }
	end

	it_should_behave_like "resource with name pages" do
	  let(:resource_class) { Tackle }
	end

	describe "show" do
		describe "related memories" do
			include_context "login user"
			let!(:tackle_memories) { FactoryGirl.create_list(:memory, 3, user: user, occured_at: Date.today.to_date) }
			let!(:tackle) { FactoryGirl.create(:tackle, user: user, memories: tackle_memories) }

			it_should_behave_like "table with related memories" do
				let!(:memories) {tackle.memories}
				let!(:other_memories) { FactoryGirl.create_list(:memory, 3, user: user, occured_at: Date.yesterday.to_date) }
				before {visit tackle_path(tackle)}
			end
		end
	end
end
