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
    @eld = Director.minimum(:dob)
    @matching_records = Director.where({ :dob=> @eld})
    @eld_director = @matching_records.at(0)
    @eld_director_name = @eld_director.name
    @eld_date = @eld.strftime("%B %d, %Y")
    render({ :template => "directors_template/eldest"})
  end

  def youngest
    young= Director.maximum(:dob)
    matching_records =Director.where({ :dob =>young})
    young_director =matching_records.at(0)
    @young_director_name= young_director.name
    @young_date =young.strftime("%B %d, %Y")
    render ({ :template => "directors_template/youngest"})
  end
end
