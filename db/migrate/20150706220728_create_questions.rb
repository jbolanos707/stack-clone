class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :user_id, :integer
      t.column :title, :string
      t.column :body, :text

      t.timestamp
    end
  end
end
