require 'rails_helper'

RSpec.describe Contact, type: :model do

	context "valid Factory" do
		it "has a valid factory" do
			expect(build(:contact)).to be_valid
		end
	end
  
	context 'validations' do
		before { FactoryGirl.build(:contact) }

		context "presence" do	
			it { should validate_presence_of(:key) }
		end

	context "uniqueness" do
		it { should validate_uniqueness_of(:key) }
	end

	end
end

