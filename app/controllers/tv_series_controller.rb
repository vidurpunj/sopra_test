class TvSeriesController < ApplicationController
  require 'roo'
  before_action :check_file, only: %w(create tv_seriel_comments)

  def index
    @tv_series = TvSeriel.includes(:comments).all
  end

  def show
    @series = TvSeriel.includes({ comments: [:user] }).find(params[:id])
  end

  def create
    spreadsheet = Roo::Spreadsheet.open(params[:file])
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |line|
      row = HashWithIndifferentAccess[[header, spreadsheet.row(line)].transpose]
      tv_serial = TvSeriel.new
      tv_serial.name = row['TV Series']
      tv_serial.genre = row["Genre"]
      tv_serial.seasons = row["No of seasons"]
      tv_serial.release_date = row["Date of First Release"]
      tv_serial.director = row["Director"]
      tv_serial.actor = row["Actor"]
      tv_serial.shoot_location = row["Shoot location"]
      tv_serial.country = row["Country"]
      tv_serial.save
    end
    flash[:notice] = 'TV series uploaded!'
    redirect_back(fallback_location: tv_series_index_path)
  end

  def tv_seriel_comments
    spreadsheet = Roo::Spreadsheet.open(params[:file])
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |line|
      row = HashWithIndifferentAccess[[header, spreadsheet.row(line)].transpose]
      comment = Comment.new
      user = User.find_by_name(row["User"])
      comment.user = user
      tv_serial = TvSeriel.find_by_name(row['TV Series'])
      comment.tv_seriel = tv_serial
      comment.stars = row['Stars']
      comment.review = row['Review']
      comment.save
    end
    flash[:notice] = 'TV series comment uploaded!'
    redirect_back(fallback_location: tv_series_index_path)
  end

  def destroy
    TvSeriel.find(params[:id]).destroy
    flash[:notice] = 'TV series removed success!'
    redirect_back(fallback_location: tv_series_index_path)
  end

  def search_actor
    @tv_series = TvSeriel.includes(:comments).where("actor like ?", "%#{params[:actor]}%")
    render 'tv_series/index'
  end

  ## check if uploaded file is a cvs
  def check_file
    unless params[:file].blank?
      if params[:file].content_type.eql?("text/csv")
      else
        flash[:alert] = "file format Invalid, expected: text/csv Got #{params[:file].content_type}"
        redirect_back(fallback_location: :tv_series_index_path)
      end
    else
      flash[:alert] = 'Please provide a file to be uploaded !'
    end
  end
end
