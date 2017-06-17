require 'rails_helper'

RSpec.describe Access, type: :model do

	context "valid Factory" do
		it "has a valid factory" do
			expect(build(:access)).to be_valid
		end
	end

	context 'validations' do
		before { FactoryGirl.build(:access) }

		context "presence" do	
			it { should validate_presence_of(:url) }
			it { should validate_presence_of(:key) }
		end
	end
end

