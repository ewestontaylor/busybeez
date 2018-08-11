class Job < ApplicationRecord
  has_many :applicants, dependent: :destroy
end
