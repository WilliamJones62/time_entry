class AddWorkDateToEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :work_date, :date
  end
end
