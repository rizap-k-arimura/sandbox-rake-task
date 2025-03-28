class HomeController < ApplicationController
  def index
    @current_version = ENV["CURRENT_VERSION"] || "Default"

    respond_to do |format|
      format.html # index.html.erb が呼ばれる
      format.json { render json: { current_version: @current_version } }
    end
  end
end
