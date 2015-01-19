class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :start_date
      t.string :kind
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
