class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy


    # scope :public, ->  { where(public: true) }
    # scope :publicly_viewable, ->  { where(public: true) }
    #scope :private, -> { where(public: false) }
    scope :visible_to, -> (user) { user ? all : self.publicly_viewable }

    def self.publicly_viewable
      where(public: true)
    end


    def self.privately_viewable
      where(public: false)
    end

end
