class CommentsController < ApplicationController
  def create
    @gig = Gig.find(params[:gig_id])
    @comment = @gig.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { redirect_to gig_path(@gig)}#,notice: '投稿しました' 
      else
        format.html { redirect_to gig_path(@gig), notice: '投稿できませんでした...' }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :index
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:gig_id, :content, :user_id)
  end
end