class ApplicationController < ActionController::Base
  def dashboard
    render({ :template => "dashboard_templates/dashboard.html.erb" })
  end
end
