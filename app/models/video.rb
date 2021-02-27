class Video < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_one_attached :video

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.video.attached?
  end
end
