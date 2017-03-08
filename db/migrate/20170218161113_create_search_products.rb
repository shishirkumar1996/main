class CreateSearchProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :search_products do |t|
      t.string :term

      t.timestamps
    end
  end
end
