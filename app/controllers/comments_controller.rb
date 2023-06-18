class CommentsController < ApplicationController
    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end

    
    def create
        puts params.inspect
        @comment = Comment.new(comment_params)
        if user_signed_in?
            @comment.user_id = current_user.id
        else
            @comment.user_id = 1
        end

        if @comment.save
            redirect_to comments_path
        else
            render :new
        end
    end
      
    
    private
    
    def comment_params
        params.require(:comment).permit(:title, :content)
    end
      
end
