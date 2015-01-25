class RemoveEventFromOrganiser < ActiveRecord::Migration
  def change
    remove_column :organisers, :event_id
  end
end
