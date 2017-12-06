class AddTriggerToAnswerUpvotes < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION delete_from_answer_downvotes() RETURNS TRIGGER AS $answer_upvotes_changes$
        BEGIN
          DELETE FROM answer_downvotes AS ans_down WHERE
          ans_down.user_id = NEW.user_id AND ans_down.answer_id = NEW.answer_id;
          RETURN NEW;
        END;
      $answer_upvotes_changes$ LANGUAGE plpgsql;

      CREATE TRIGGER answer_upvotes_changes
      BEFORE INSERT OR UPDATE ON answer_upvotes
        FOR EACH ROW EXECUTE PROCEDURE delete_from_answer_downvotes();
    SQL
  end
  def down
    execute <<-SQL
      DROP TRIGGER IF EXISTS answer_upvotes_changes ON answer_upvotes;
    SQL
  end
end
