class Movie < ActiveRecord::Base
  
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
  
  def to_param
    [id, name.parameterize].join("-")
  end
  
end
