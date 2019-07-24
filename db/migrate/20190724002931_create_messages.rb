class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.datetime :created_at
      t.references :stay, foreign_key: true

      t.timestamps
    end
  end
end
