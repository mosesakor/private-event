class AddCreatorId < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :creator, index:true, foreign_key: true
  end
end
