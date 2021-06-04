class TvSeriesController < ApplicationController
  require 'roo'

  def index
    @tv_series = TvSeriel.all
  end

  def create
    spreadsheet = Roo::Spreadsheet.open(params[:tv_serial_list])
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
    redirect_back(fallback_location: tv_series_index_path)
  end
end
