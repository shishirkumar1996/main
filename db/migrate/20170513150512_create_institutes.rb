class CreateInstitutes < ActiveRecord::Migration[5.0]
  def up
    create_table :institutes do |t|
      t.string :name
      t.references :domain, foreign_key: true
      t.timestamps
    end
    add_index :institutes, :name
  end

  def down
    drop_table :institutes
  end
end
