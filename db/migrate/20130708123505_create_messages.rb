class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.references :channel, index: true
      t.references :author, index: true

      t.timestamps
    end
  end
end
