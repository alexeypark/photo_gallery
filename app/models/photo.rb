class Photo < ApplicationRecord
  mount_uploader :image, PhotoUploader
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user_id, :title, :image, presence: true

  def average_score
    average = 0.0
    self.comments.each do |comment|
     average += comment.rate
    end
    (average / self.comments.count).round(1)
  end
end
