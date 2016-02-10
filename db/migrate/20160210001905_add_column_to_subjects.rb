class AddColumnToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :article_id, :integer
    add_column :subjects, :tag_id, :integer
  end
end
