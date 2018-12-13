class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.datetime :date
      t.string :workout_type
      t.string :mood
      t.integer :length

      t.timestamps
    end
  end
end