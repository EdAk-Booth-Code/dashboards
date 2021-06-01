class ApplicationController < ActionController::Base

  def show_methods
    render({:template => "/layouts/index.html.erb"})
  end

end
