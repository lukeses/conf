class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :skype
      t.boolean :is_paid
      t.boolean :is_guest
      t.text :description
      t.references :event, index: true

      t.timestamps
    end
  end
end
