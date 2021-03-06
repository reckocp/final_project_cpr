class CommentsController < ApplicationController
  def index
  end

  def show
    @comment = get_comment
  end

  def new
    @comment = Comment.new
  end

  def create
    @post =  Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back, notice: 'Comment was successfully created.' }
        format.js   { }
        format.json { render json: @comment.to_json(include: :user) }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    get_comment
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def get_comment
    @comment = Comment.find(params[:comment_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :body, :user_id, :post_id)
  end
end
