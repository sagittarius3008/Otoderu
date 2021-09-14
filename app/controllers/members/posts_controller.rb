class Members::PostsController < ApplicationController
  def show
    @post = Post.new
    @posts = Post.where(orchestra_id: params[:id])
  end

  def create
    post = Post.new(post_params)
    post.orchestra_id = params[:post][:orchestra_id]
    post.member_id = current_member.id
    post.score = Language.get_data(post_params[:body])
    if post.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to request.referer
    else
      flash[:notice] = "投稿内容をご確認ください。"
      redirect_to request.referer
    end
  end

  def destroy
    post = Post.find(params[:post][:id])
    post.destroy
    flash[:notice] = "口コミを削除しました。"
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:body, :id, :orchestra_id)
  end
end
