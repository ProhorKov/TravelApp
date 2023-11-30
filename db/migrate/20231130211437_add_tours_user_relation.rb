class AddToursUserRelation < ActiveRecord::Migration[7.1]
  def change
    create_table :tours_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :tour
    end
  end
end
