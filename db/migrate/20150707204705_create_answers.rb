class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.column :question_id, :integer
      t.column :user_id, :integer
      t.column :body, :text

      t.timestamps
    end
  end
end
