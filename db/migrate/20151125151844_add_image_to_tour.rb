class AddImageToTour < ActiveRecord::Migration
  def change
    change_table :tours do |t|
      t.has_attached_file :image
    end
  end
end
