class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.text :title
      t.boolean :is_used, default: false

      t.timestamps
    end
  end
end
