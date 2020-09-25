class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :author

      #'text' --> some databases will use 'varchar' for textareas, others will use 'text' (postgres)
      # the database adapter will be used to determine the right one


      t.timestamps
    end
  end
end
