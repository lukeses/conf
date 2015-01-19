class CreateEventOrganisers < ActiveRecord::Migration
  def change
    create_table :event_organisers do |t|
      t.references :event, index: true
      t.references :organiser, index: true

      t.timestamps
    end
  end
end
