class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :end_date
      t.datetime :reminder
      t.references :sponsor, index: true
      t.references :organiser, index: true
      t.references :speaker, index: true

      t.timestamps
    end
  end
end
