class AddCategoryToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :category, foreign_key: true
  end
end
