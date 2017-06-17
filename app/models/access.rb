class Access < ApplicationRecord
	validates :url, :key, presence: true

  belongs_to :contact
end
