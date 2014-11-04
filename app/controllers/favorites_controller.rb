class FavoritesController < ApplicationController
    def destroy
      @post = Post.find(params[:post_id])
      favorite = current_user.favorites.find(params[:id])
      authorize favorite

       if favorite.destroy
         flash[:notice] = "Post is a Unfavorited."
         redirect_to [@post.topic, @post]
         # Flash success and redirect to @post
       else
         flash[:error] = "Post couldn't be Unfavorited. Try again."
         redirect_to [@post.topic, @post]
         # Flash error and redirect to @post
       end
    end

 def create
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: @post)
     authorize favorite

     if favorite.save
       flash[:notice] = "Post is a favorite."
       redirect_to [@post.topic, @post]

     else
       flash[:error] = "There was an error favoriting this post. Please try again."
       redirect_to [@post.topic, @post]

     end
   end
end
