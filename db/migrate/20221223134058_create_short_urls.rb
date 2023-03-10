class CreateShortUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :short_urls do |t|
      t.string :original_url
      t.string :shorted_url
      t.string :title
      t.integer :redirects, default: 0

      t.timestamps
    end
  end
end
