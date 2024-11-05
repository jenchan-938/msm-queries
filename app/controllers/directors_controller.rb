class DirectorsController < ApplicationController
  def index
      render({ :template => "directors_template/list"})
  end
end
