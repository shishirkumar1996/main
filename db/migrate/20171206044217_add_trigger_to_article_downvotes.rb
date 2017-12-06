class AddTriggerToArticleDownvotes < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION delete_from_article_upvotes() RETURNS TRIGGER AS $article_downvotes_changes$
        BEGIN
          DELETE FROM article_upvotes AS art_up WHERE
          art_up.user_id = NEW.user_id AND art_up.article_id = NEW.article_id;
          RETURN NEW;
        END;
      $article_downvotes_changes$ LANGUAGE plpgsql;

      CREATE TRIGGER article_downvotes_changes
      BEFORE INSERT OR UPDATE ON article_downvotes
        FOR EACH ROW EXECUTE PROCEDURE delete_from_article_upvotes();
    SQL
  end
  def down
    execute <<-SQL
      DROP TRIGGER IF EXISTS article_downvotes_changes ON article_downvotes;
    SQL
  end
end
