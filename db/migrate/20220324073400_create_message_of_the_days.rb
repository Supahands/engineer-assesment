class CreateMessageOfTheDays < ActiveRecord::Migration[6.1]
  def change
    create_table :message_of_the_days do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
