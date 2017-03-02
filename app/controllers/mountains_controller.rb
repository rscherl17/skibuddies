class MountainsController < ApplicationController
  def index
    @q = Mountain.ransack(params[:q])
    @mountains = @q.result(:distinct => true).includes(:trails, :photos).page(params[:page]).per(10)

    render("mountains/index.html.erb")
  end

  def show
    @photo = Photo.new
    @trail = Trail.new
    @mountain = Mountain.find(params[:id])


    render("mountains/show.html.erb")
  end

  def new
    @mountain = Mountain.new

    render("mountains/new.html.erb")
  end

  def create
    @mountain = Mountain.new

    @mountain.mountain_name = params[:mountain_name]
    @mountain.location = params[:location]
    @mountain.vertical_feet = params[:vertical_feet]
    @mountain.skiable_acres = params[:skiable_acres]
    @mountain.number_of_trails = params[:number_of_trails]

    save_status = @mountain.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/mountains/new", "/create_mountain"
        redirect_to("/mountains")
      else
        redirect_back(:fallback_location => "/", :notice => "Mountain created successfully.")
      end
    else
      render("mountains/new.html.erb")
    end
  end

  def edit
    @mountain = Mountain.find(params[:id])

    render("mountains/edit.html.erb")
  end

  def update
    @mountain = Mountain.find(params[:id])

    @mountain.mountain_name = params[:mountain_name]
    @mountain.location = params[:location]
    @mountain.vertical_feet = params[:vertical_feet]
    @mountain.skiable_acres = params[:skiable_acres]
    @mountain.number_of_trails = params[:number_of_trails]

    save_status = @mountain.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/mountains/#{@mountain.id}/edit", "/update_mountain"
        redirect_to("/mountains/#{@mountain.id}", :notice => "Mountain updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Mountain updated successfully.")
      end
    else
      render("mountains/edit.html.erb")
    end
  end

  def destroy
    @mountain = Mountain.find(params[:id])

    @mountain.destroy

    if URI(request.referer).path == "/mountains/#{@mountain.id}"
      redirect_to("/", :notice => "Mountain deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Mountain deleted.")
    end
  end
end
