class ApplicationController < ActionController::Base

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  private

  def set_flash(save_errors)
    flash.alert = save_errors.messages.map do |field, errors|
      "#{field.to_s.capitalize} #{errors.first}"
    end
  end
end
