class Contact < ApplicationRecord
	validates :key, presence: true
	validates :email, uniqueness: true
	validates :key, uniqueness: true
end
