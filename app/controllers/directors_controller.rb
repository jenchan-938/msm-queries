class DirectorsController < ApplicationController
  def index
      render({ :template => "directors_template/list"})
  end

  def show
    the_id = params.fetch("an_id")  
    matching_records =Director.where({ :id=> the_id})
    @the_director =matching_records.at(0)

    render ({ :template => "directors_template/details"})
  end

  def eldest
    @eld = Director.maximum(:dob)
    @matching_records = Director.where({ :dob=> @eld})
    @eld_director = @matching_records.at(0)
    @eld_director_name = @eld_director.name
    @eld_date = @eld.strftime("%B %d, %Y")
    render({ :template => "directors_template/eldest"})
  end

end
