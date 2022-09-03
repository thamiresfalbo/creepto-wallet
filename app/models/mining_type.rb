# frozen_string_literal: true

class MiningType < ApplicationRecord
  has_many :coins
end
