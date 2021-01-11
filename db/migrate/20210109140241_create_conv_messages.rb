class CreateConvMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :conv_messages do |t|
      t.integer :conversation_id
      t.text :message

      t.timestamps
    end
  end
end
