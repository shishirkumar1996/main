class RenameAnswerRelations < ActiveRecord::Migration[5.0]
  def up
    rename_table :answerrelations, :answer_upvotes
    rename_table :badanswerrelations, :answer_downvotes
  end
  def down
    rename_table :answer_upvotes, :answerrelations
    rename_table :answer_downvotes, :badanswerrelations
  end
end
