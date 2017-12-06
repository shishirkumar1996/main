class AddTriggerToArticleUpvotes < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION delete_from_article_downvotes() RETURNS TRIGGER AS $article_upvotes_changes$
        BEGIN
          DELETE FROM article_downvotes AS art_down WHERE
          art_down.user_id = NEW.user_id AND art_down.article_id = NEW.article_id;
          RETURN NEW;
        END;
      $article_upvotes_changes$ LANGUAGE plpgsql;

      CREATE TRIGGER article_upvotes_changes
      BEFORE INSERT OR UPDATE ON article_upvotes
        FOR EACH ROW EXECUTE PROCEDURE delete_from_article_downvotes();
    SQL
  end
  def down
    execute <<-SQL
      DROP TRIGGER IF EXISTS article_upvotes_changes ON article_upvotes;
    SQL
  end
end
