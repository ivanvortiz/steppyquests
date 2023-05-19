class ScenesController < ApplicationController
  before_action :set_scene, only: %i[ show edit update destroy ]
  
  # CREATE .../scenes/1 or .../scenes/1.json
  def create
    @quest = Quest.find(params[:quest_id])
    @scene = @quest.scenes.create(scene_params)
    redirect_to quest_path(@quest)
  end

  def show
  end

  # DELETE /quests/1 or /quests/1.json
    def destroy
    puts "params = #{params}"
    @scene = Scene.find(params[:id])
    @scene.destroy

    respond_to do |format|
      format.html { redirect_to quest_url(Quest.find(params[:quest_id])), notice: "Scene was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def scene_params
    params.require(:scene).permit(:title, :body)
  end

  def set_scene
    @scene = Scene.find(params[:id])
  end

end
