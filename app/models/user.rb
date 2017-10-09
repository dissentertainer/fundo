class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pledges
  has_many :foundation, -> { distinct }, through: :pledges

  default_scope -> { order("created_at ASC") }
end
