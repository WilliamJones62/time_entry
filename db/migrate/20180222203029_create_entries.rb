class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :name
      t.string :project
      t.float :hours

      t.timestamps
    end
  end
end
