class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    @current_user ||= begin
      ip = request.headers['X-Forwarded-For'].presence&.split(',')&.first&.strip || request.remote_ip
      User.find_or_create_by(ip_address: ip)
    end
  end
end
