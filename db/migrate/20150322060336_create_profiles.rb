class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :profile_name, index: true
      t.string :display_name, index: true
      t.text :about, index: true
      t.string  :genre, index: true
      t.text :location, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
