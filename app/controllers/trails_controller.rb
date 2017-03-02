class TrailsController < ApplicationController
  def index
    @trails = Trail.page(params[:page]).per(10)

    render("trails/index.html.erb")
  end

  def show
    @comment = Comment.new
    @trail = Trail.find(params[:id])

    render("trails/show.html.erb")
  end

  def new
    @trail = Trail.new

    render("trails/new.html.erb")
  end

  def create
    @trail = Trail.new

    @trail.trail_name = params[:trail_name]
    @trail.mountain_id = params[:mountain_id]

    save_status = @trail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/trails/new", "/create_trail"
        redirect_to("/trails")
      else
        redirect_back(:fallback_location => "/", :notice => "Trail created successfully.")
      end
    else
      render("trails/new.html.erb")
    end
  end

  def edit
    @trail = Trail.find(params[:id])

    render("trails/edit.html.erb")
  end

  def update
    @trail = Trail.find(params[:id])

    @trail.trail_name = params[:trail_name]
    @trail.mountain_id = params[:mountain_id]

    save_status = @trail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/trails/#{@trail.id}/edit", "/update_trail"
        redirect_to("/trails/#{@trail.id}", :notice => "Trail updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Trail updated successfully.")
      end
    else
      render("trails/edit.html.erb")
    end
  end

  def destroy
    @trail = Trail.find(params[:id])

    @trail.destroy

    if URI(request.referer).path == "/trails/#{@trail.id}"
      redirect_to("/", :notice => "Trail deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Trail deleted.")
    end
  end
end
