class MachinesController < ApplicationController
  before_filter :authorize, :only => [:edit,:delete,:new]

  def index
    @machines = Machine.search(params[:search])
  end

  def show
    @m = Machine.find_by_id(params[:id])
  end

  def new
    if params[:machine] and request.post?
      m = Machine.new(params[:machine])
      if m.save
        flash[:notice] = "Machine #{m.name} added"
        redirect_to :action => "index"
      else
        flash[:warning] = "There was an error saving the machine!"
        redirect_to :action => "new"
      end
    end
  end

  def edit
    @machine = Machine.find_by_id(params[:id])
    if (params[:machine])
      if @machine.update_attributes(params[:machine])
        flash[:notice] = "Machine #{@machine.name} updated"
        redirect_to :action => "index"
      else
        flash[:warning] = "There was an error updating the machine!"
        redirect_to :action => "edit"
      end
    end
  end

  def delete
    @m = Machine.find_by_id(params[:id])
    if @m.destroy
      flash[:notice] = "Machine has been deleted"
      redirect_to :action => "index"
    else
      flash[:warning] = "There was an error deleting the machine"
      redirect_to :action => "index"
    end
  end

  def search
    @machines = Machine.find_by_sql "SELECT * FROM 'machines' WHERE name LIKE '%lava21%' OR ip LIKE '%10.5.140.1%'"
  end

  protected
  def authorize
    if session[:logged_in] == false
      authenticate_or_request_with_http_basic do |username, password|
        user = User.authenticate(username, password)
        unless user.nil?
          session[:logged_in] = true
          session[:user] = user
          return true
        else
          session[:logged_in] = false
          return false
        end
      end
    end
  end

end
