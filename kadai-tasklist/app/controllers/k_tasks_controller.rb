class KTasksController < ApplicationController
  def index
    @k_tasks = KTask.all
  end
  
  def show
    @k_task = KTask.find(params[:id])
  end
  
  def new
    @k_task = KTask.new
  end
  
  def create
    @k_task = KTask.new(message_params)

    if @k_task.save
      flash[:success] = 'KTask が正常に投稿されました'
      redirect_to @k_task
    else
      flash.now[:danger] = 'KTask が投稿されませんでした'
      render :new
    end
  end
  
  def create
    @k_task = KTask.new(k_task_params)

    if @k_task.save
      flash[:success] = 'KTask が正常に投稿されました'
      redirect_to @k_task
    else
      flash.now[:danger] = 'KTask が投稿されませんでした'
      render :new
    end
  end
  
  def edit
    @k_task = KTask.find(params[:id])
  end
  
  def update
    @k_task = KTask.find(params[:id])

    if @k_task.update(k_task_params)
      flash[:success] = 'KTask は正常に更新されました'
      redirect_to @k_task
    else
      flash.now[:danger] = 'KTask は更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @k_task = KTask.find(params[:id])
    @k_task.destroy

    flash[:success] = 'KTask は正常に削除されました'
    redirect_to k_tasks_url
  end
  
  private
  
  def k_task_params
    params.require(:k_task).permit(:content)
  end
  
end
