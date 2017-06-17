require 'securerandom'

FactoryGirl.define do
	factory :access do
		url { Faker::Internet.url }
		key { SecureRandom.uuid }
		association :contact, factory: :contact
	end
end

