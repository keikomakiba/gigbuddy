class CreateGigs < ActiveRecord::Migration[5.1]
  def change
    create_table :gigs do |t|
     t.integer :gig_id
     t.string :artist
     t.string :place
     t.string :image
     t.integer :user_id
     t.datetime "created_at", null: false
     t.datetime "updated_at", null: false
    end
  end
end
