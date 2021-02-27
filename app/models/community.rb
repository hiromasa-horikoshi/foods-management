class Community < ApplicationRecord
  has_many :community_users, dependent: :destroy
  has_many :users, through: :community_users
  has_many :videos, dependent: :destroy

  validates :name, presence: true
end
