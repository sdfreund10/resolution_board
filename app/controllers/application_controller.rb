class ApplicationController < ActionController::Base
  private

  def set_flash(save_errors)
    flash.alert = save_errors.messages.map do |field, errors|
      "#{field.to_s.capitalize} #{errors.first}"
    end
  end
end
