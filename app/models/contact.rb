class Contact < ApplicationRecord
	validates :key, presence: true
	validates :key, uniqueness: true

	has_many :accesses
end
