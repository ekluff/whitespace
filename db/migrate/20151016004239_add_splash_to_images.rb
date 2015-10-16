class AddSplashToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :splash, :boolean
  end

  def self.down
    remove_column :images, :splash, :boolean
  end
end
