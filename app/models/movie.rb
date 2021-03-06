class Movie < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }

  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def self.search(search)
    if Rails.env.production?
      where("name ILIKE ?", "%#{search}%")  # pg
    else
      where("name LIKE ?", "%#{search}%")   # sqlite3
    end
  end

end
