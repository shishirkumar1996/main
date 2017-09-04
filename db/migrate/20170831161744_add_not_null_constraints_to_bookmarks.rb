class AddNotNullConstraintsToBookmarks < ActiveRecord::Migration[5.0]
  TABLE_BOOKMARKS = ['article', 'answer', 'question']
  def change
    TABLE_BOOKMARKS.each do |table_bookmark|
      table_name = (table_bookmark + '_bookmark_relations').to_sym
      change_column_null table_name, :user_id, false
      foreign_column = (table_bookmark + '_id').to_sym
      change_column_null table_name, foreign_column, false
    end
  end
end
