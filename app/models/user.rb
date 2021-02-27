class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  serialize :unpalatability, Array

  with_options presence: true do
    validates :name
    validates :password, on: :create, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,12}+\z/i }
    validates :unpalatability, on: [:create, :update]
  end
  
  has_many :community_users
  has_many :communities, through: :community_users
  has_many :videos
end
