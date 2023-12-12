class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.text :description
      t.string :director
      t.date :release_date
      t.string :run_time
      t.string :production_company
      t.text :review
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
