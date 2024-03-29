class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :surname
      t.text :description
      t.references :event, index: true

      t.timestamps
    end
  end
end
