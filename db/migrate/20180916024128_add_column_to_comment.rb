class AddColumnToComment < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :gig, foreign_key: true
  end
end
