class Room < ApplicationRecord
  has_many :attempts, dependent: :destroy
end
