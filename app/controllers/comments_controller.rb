class CommentsController < ApplicationController
   respond_to :html, :js
  def destroy

     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
     authorize @comment

     if @comment.destroy
       flash[:notice] = "Comment was removed."

     else
       flash[:error] = "Comment couldn't be deleted. Try again."

     end

     respond_with(@comment) do |format|
       format.html { redirect_to [@post.topic, @post] }
     end

   end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
    authorize @comment
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
      @new_comment = Comment.new
    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."

    else
      flash[:error] = "There was an error saving the comment. Please try again."

    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
