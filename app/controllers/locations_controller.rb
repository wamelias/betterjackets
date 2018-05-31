class LocationsController < ApplicationController
  def index
    @locations = Location.all

    render("locations/index.html.erb")
  end

  def show
    @location = Location.find(params[:id])

    render("locations/show.html.erb")
  end

  def new
    @location = Location.new

    render("locations/new.html.erb")
  end

  def create
    @location = Location.new

    @location.zipcode = params[:zipcode]
    @location.user_id = params[:user_id]
    @location.nickname = params[:nickname]

    save_status = @location.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/locations/new", "/create_location"
        redirect_to("/locations")
      else
        redirect_back(:fallback_location => "/", :notice => "Location created successfully.")
      end
    else
      render("locations/new.html.erb")
    end
  end

  def edit
    @location = Location.find(params[:id])

    render("locations/edit.html.erb")
  end

  def update
    @location = Location.find(params[:id])

    @location.zipcode = params[:zipcode]
    @location.user_id = params[:user_id]
    @location.nickname = params[:nickname]

    save_status = @location.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/locations/#{@location.id}/edit", "/update_location"
        redirect_to("/locations/#{@location.id}", :notice => "Location updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Location updated successfully.")
      end
    else
      render("locations/edit.html.erb")
    end
  end

  def destroy
    @location = Location.find(params[:id])

    @location.destroy

    if URI(request.referer).path == "/locations/#{@location.id}"
      redirect_to("/", :notice => "Location deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Location deleted.")
    end
  end
end
