class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  has_many :posts, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :friends, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
end
