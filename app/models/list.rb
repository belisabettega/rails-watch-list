class List < ApplicationRecord
  has_many :bookmarks, :dependent => :destroy
  validates :name, uniqueness: true, presence: true
  has_many :movies, through: :bookmarks
  has_one_attached :photo
  validates :photo, presence: true
end
