require 'securerandom'

FactoryGirl.define do
	factory :contact do
		name { Faker::Name.name }
		email { Faker::Internet.safe_email(Faker::Name.first_name) }
		key SecureRandom.uuid
	end
end

