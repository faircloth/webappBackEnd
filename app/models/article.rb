class Article < ActiveRecord::Base

  has_many :subjects
  has_many :tags, through: :subjects
  
  validates :title, presence: true,
                      length: { minimum: 2 }

  # to populate drop down of tag names in create article form
  def tag_hash
    Tag.all.map { |tag| [tag.name, tag.id] }
  end

  # <div class="field">
  #   <%= f.text_field :tag %>
  # </div>
  # <p><%= @article.tag_hash %></p>

end
