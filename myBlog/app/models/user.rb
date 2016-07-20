class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  has_secure_password
  #validates :name, presence: true
  #validates :name, length: { minimum: 2 }
  #validates :name, length: { maximum: 10 }

  #validates :name, uniqueness: true
  #validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "Only letters is allowed" }
end