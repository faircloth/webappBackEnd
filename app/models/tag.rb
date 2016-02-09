class Tag < ActiveRecord::Base
  # has_and_belongs_to_many :articles, :join_table => "articles_tags"

  has_many :articles, through: :articles_tags

  def get_articles (name)
    Article.where("tag = ?", name)
  end

end
