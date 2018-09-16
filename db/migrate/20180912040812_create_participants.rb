class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.integer :user_id
      t.integer :gig_id
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      
      t.timestamps
    end
  end
end
