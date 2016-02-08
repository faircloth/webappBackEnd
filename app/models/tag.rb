class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles, :join_table => "articles_tags"
end
