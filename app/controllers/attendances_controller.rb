class AttendancesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @event = Event.find(attendance_params[:event_id])
    @event.attendances.create(user_id: current_user.id)
    redirect_to event_url(@event)
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    current_user.attendances.destroy(@attendance)
    redirect_to(:back)
  end

  private
    def attendance_params
      params.require(:attendance).permit(:event_id)
    end
end