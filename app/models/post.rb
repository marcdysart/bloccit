class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
    belongs_to :topic
  scope :created_before, ->(time) { where("created_at < ?", time) }
  scope :ordered_by_title, -> { order('title DESC') }
  scope :ordered_by_reverse_created_at, -> {order('created_at ASC')}
  default_scope { order('created_at DESC') }
end
