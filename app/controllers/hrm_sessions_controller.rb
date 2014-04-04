class HrmSessionsController < ApplicationController
  include ApplicationHelper

  def index
    @hrm_sessions = HrmSession.page(params[:page]).includes(:hrm_data_points, :user)

    # @all = HrmSession.find_by_sql("SELECT * FROM hrm_sessions
    #   INNER JOIN hrm_data_points ON (hrm_sessions.id = hrm_data_points.hrm_session_id)
    #   INNER JOIN users ON (hrm_sessions.user_id = users.id)
    #   ORDER By hrm_sessions.created_at desc;")
  end

end