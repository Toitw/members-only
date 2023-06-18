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
        @comment.user = current_user
        if @comment.save
            puts "good"
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
