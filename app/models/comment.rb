class Comment < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user
end
