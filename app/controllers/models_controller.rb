class ModelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_model, only: [:show, :update, :destroy, :edit]
  before_action :set_lesson, only: [:new]
  before_action :set_model_update, only: [:edit, :update, :destroy]


  def new
    @model = Model.new
  end

  def create
    @lesson = current_user.lessons.find(params[:lesson_id])
    @lesson.models.build(model_params)

    respond_to do |format|
      if @lesson.save
        @model = Model.find(@lesson.models.last)
        format.html { redirect_to edit_model_path(@model)}
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @thislesson = Lesson.find(@model.lesson_id)
  end

  def update
    respond_to do |format|
       if @model.update(model_params)
         format.html { redirect_to  course_topic_lesson_path(@course, @topic, @lesson), notice: 'Role Model was successfully updated.' }
         format.json { render :show, status: :ok, location: @model }
       else
         format.html { render :edit }
         format.json { render json: @model.errors, status: :unprocessable_entity }
       end
    end
  end

  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to course_topic_lesson_path(@course, @topic, @lesson), notice: 'Role Model was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_model
    @model = Model.find(params[:id])
  end

  def model_params
    params.require(:model).permit(:user_id, :lesson_id, :title, :script, :privacy, :language, :token, :video_token, :position_prior)
  end

  def set_model_update
    @model = Model.find(params[:id])
    @lesson = Lesson.find(@model.lesson_id)
    @topic = Topic.find(@lesson.topic_id)
    @course = Course.find(@topic.course_id)
  end
end
