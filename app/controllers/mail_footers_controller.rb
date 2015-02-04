class MailFootersController < ApplicationController

  def index
    @res = ActiveRecord::Base.connection.execute("call mail_footers")
  end



end