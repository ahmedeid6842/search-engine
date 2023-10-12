class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable

  has_many :search_analytics_dates, foreign_key: 'user_id'
  has_many :search_analytics, through: :search_analytics_dates
  has_many :article, foreign_key: 'author_id'
end
