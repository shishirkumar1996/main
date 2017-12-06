class AddTriggerToAnswerDownvotes < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION delete_from_answer_upvotes() RETURNS TRIGGER AS $answer_downvotes_changes$
        BEGIN
          DELETE FROM answer_upvotes AS ans_up WHERE
          ans_up.user_id = NEW.user_id AND ans_up.answer_id = NEW.answer_id;
          RETURN NEW;
        END;
      $answer_downvotes_changes$ LANGUAGE plpgsql;

      CREATE TRIGGER answer_downvotes_changes
      BEFORE INSERT OR UPDATE ON answer_downvotes
        FOR EACH ROW EXECUTE PROCEDURE delete_from_answer_upvotes();
    SQL
  end
  def down
    execute <<-SQL
      DROP TRIGGER IF EXISTS answer_downvotes_changes ON answer_downvotes;
    SQL
  end
end
