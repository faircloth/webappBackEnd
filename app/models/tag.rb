class Tag < ActiveRecord::Base
  
  has_many :subjects
  has_many :articles, through: :subjects

  def get_articles (name)
    Article.where("tag = ?", name)
  end

end
