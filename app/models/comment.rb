class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  default_scope -> { order(:created_at) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :commentable_id, presence: true
  validates :commentable_type, presence: true
end
