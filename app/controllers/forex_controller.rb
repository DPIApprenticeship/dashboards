class ForexController < ApplicationController
  def index
    render({ :template => "forex_templates/index.html.erb"})
  end
end