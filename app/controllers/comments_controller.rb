class CommentsController < ApplicationController
    def index
        @comments = Comment.all
        @comment = Comment.new
    end

    
    def create
        @comment = Comment.new(comment_params)
        respond_to do |format|
          if @comment.save
            format.turbo_stream { render turbo_stream: turbo_stream.append("comments", @comment) }
            format.html { redirect_to comments_path, notice: "Comment created successfully." }
          else
            format.turbo_stream { render turbo_stream: turbo_stream.append("comments", @comment), status: :unprocessable_entity }
            format.html { render :new }
          end
        end
      end
      
    
    private
    
    def comment_params
        params.require(:comment).permit(:author_name, :body, :article_id)
    end
end
