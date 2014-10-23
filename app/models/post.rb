class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
    belongs_to :topic
    mount_uploader :image, ImageUploader
  scope :created_before, ->(time) { where("created_at < ?", time) }
  scope :ordered_by_title, -> { order('title DESC') }
  scope :ordered_by_reverse_created_at, -> {order('created_at ASC')}
  default_scope { order('created_at DESC') }

   validates :title, length: { minimum: 5 }, presence: true
   validates :body, length: { minimum: 20 }, presence: true
   validates :topic, presence: true
   validates :user, presence: true

   def markdown_title
     render_as_markdown title
   end

  def markdown_body
    render_as_markdown body
  end
end
