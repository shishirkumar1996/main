class RenameRepliesToAnswerReplies < ActiveRecord::Migration[5.0]
  def up
    rename_table :replies, :answer_replies
  end

  def down
    rename_table :answer_replies, :replies
  end
end
