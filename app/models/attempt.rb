class Attempt < ApplicationRecord
  belongs_to :room

  serialize :guesses, Array
end
