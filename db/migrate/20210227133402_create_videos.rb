class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.references :user,      foreign_key: true
      t.references :community, foreign_key: true
      t.string     :content,   null: false
      t.timestamps
    end
  end
end
