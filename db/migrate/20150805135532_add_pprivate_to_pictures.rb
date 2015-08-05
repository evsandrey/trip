class AddPprivateToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :pprivate, :boolean, default: false
  end
end
