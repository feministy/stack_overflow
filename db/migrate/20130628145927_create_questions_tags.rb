class CreateQuestionsTags < ActiveRecord::Migration
  def change
    create_table :questions_tags do |t|
      t.integer :tag_id
      t.integer :question_id

      t.timestamps
    end
  end
end
