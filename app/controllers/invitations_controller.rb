class InvitationsController < ApplicationController

  def index
    @res = ActiveRecord::Base.connection.execute("select invitation(kind, start_date) from events")
  end



end