class RemoveDomainFromQuestion < ActiveRecord::Migration[5.0]
  def up
    remove_reference :questions, :domain, foreign_key: true, index: true
  end

  def down
    add_reference :questions, :domain, foreign_key: true, index: true
  end
end
