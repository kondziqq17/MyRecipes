class CommentsController < ApplicationController
before_action :require_user, except: [:show]
before_action :require_user_comment, only: [:comment]


def create
	@recipe = Recipe.find(params[:recipe_id])
	@comment = @recipe.comments.create(comment_params)

	if @comment.save
		redirect_to recipe_path(@recipe)
	else
		render 'new'
	end
end

def destroy
	@recipe = Recipe.find(params[:recipe_id])
		Comment.find(params[:id]).destroy
			flash[:success] = "Comment Deleted"
				redirect_to recipe_path(@recipe)

end

private
	
	def comment_params
		params.require(:comment).permit(:body, :commenter)
	end

	def require_user_comment
    	if !logged_in?
      		flash[:danger] = "You must be logged in to perform that action"
      		redirect_to :back
    		end
  		end
	end
	