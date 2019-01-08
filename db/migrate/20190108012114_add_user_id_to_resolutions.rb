class AddUserIdToResolutions < ActiveRecord::Migration[5.2]
  def change
    add_reference :resolutions, :user
  end
end
