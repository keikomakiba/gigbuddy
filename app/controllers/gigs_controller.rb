class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :edit, :destroy, :update]
  before_action :log_in?, only: [:new, :edit, :show, :destroy, :index] 
  def index
    @gig = Gig.all.order(created_at: :desc)
    @search = Gig.ransack(params[:q])
    @gigs = @search.result
    @gigs = @gigs.page(params[:page]) 
  end
  
  def new
    if params[:back]
      @gig = Gig.new(gig_params)
    else
      @gig = Gig.new
    end
  end  
  
  def create
    @gig = Gig.new(gig_params) # モデルにDB操作の命令を出す
    @gig.user_id = current_user.id
    respond_to do |format|
      if @gig.save
        GigMailer.gig_mail(@gig).deliver
        format.html { redirect_to gigs_path(@gig), notice: 'Gig was successfully created.' }
        format.json { render :show, status: :created, location: @gig }
      else
        format.html { render :new }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    
        @user = User.find_by(id: @gig.user_id)
      end
  end 

  def show
    @participant = current_user.participants.find_by(gig_id: @gig.id)
    @comments = @gig.comments
    @comment = @gig.comments.build
  end
  
  def edit
  end
  
  def update
    if @gig.update(gig_params)
      redirect_to gigs_path, notice: "update！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @gig.destroy
    redirect_to gigs_path, notice:"delete！"
  end
  
  def confirm
    @gig = Gig.new(gig_params)
    @gig.user_id = current_user.id
    render :new if @gig.invalid?
  end
  
  private
  def log_in?
    if current_user.blank?
      redirect_to new_session_path
    end
  end
    
  def gig_params
    params.require(:gig).permit(:name, :email, :artist, :place, :image, :image_cache, :user_id)
  end
  
  def set_gig
    @gig = Gig.find(params[:id])
  end
end
