class WorkoutsController < ApplicationController
  before_action :get_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = Workout.all.order(date: 'DESC')
  end

  def show
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      redirect_to @workout
      flash[:notice] = "Workout sucessfully saved!"
    else
      render 'new'
      flash[:error] = "Workout could not be saved!"
    end
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout
      flash[:notice] = "Workout sucessfully updated!"
    else
      render 'edit'
      flash[:error] = "Workout could not be updated!"
    end
  end

  def destroy
    if @workout.destroy
      redirect_to workouts_path
      flash[:notice] = "Workout sucessfully deleted!"
    else
      redirect_back(fallback_location: workouts_path)
      flash[:error] = "Workout could not be deleted!"
    end
  end

  private
  def workout_params
    params.require(:workout).permit(:date, :workout_type, :mood, :length)
  end

  def get_workout
    @workout = Workout.find(params[:id])
  end
end