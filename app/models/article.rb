class Article < ActiveRecord::Base
  has_and_belongs_to_many :tags,  :join_table => "articles_tags"

  validates :title, presence: true,
                      length: { minimum: 2 }
end
