class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :subject

      t.timestamps
    end
  end
end
