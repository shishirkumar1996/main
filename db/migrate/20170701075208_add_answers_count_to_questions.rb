class AddAnswersCountToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :answers_count, :integer, default: 0, null: false

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
      UPDATE questions
        SET answers_count = (SELECT count(1)
                               FROM answers
                              WHERE answers.question_id = questions.id)
    SQL
  end
end
