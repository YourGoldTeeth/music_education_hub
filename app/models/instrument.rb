class Instrument < ApplicationRecord
	has_many :resources
	has_many :users
end
