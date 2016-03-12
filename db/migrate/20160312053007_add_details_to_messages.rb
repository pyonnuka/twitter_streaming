class AddDetailsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :username, :string
    add_column :messages, :screen_name, :string
    add_column :messages, :image_url, :string
  end
end
