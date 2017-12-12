class MatcherController < ApplicationController
  def new
    @first_name = params[:first_name].presence
    @second_name = params[:second_name].presence
  end

  def show
    @first_name = params[:matcher][:first_name].capitalize.presence || 'Ricardão'
    @second_name = params[:matcher][:second_name].capitalize.presence || 'Tchutchuca'

    key = [@first_name, @second_name].sort.sum
    time_together = calculate_time(key).zero? ? 1 : calculate_time(key)

    @years = time_together / 360
    @months = time_together % 30 / 12
    @months = @months.zero? ? 1 : @months
    @days = time_together % 30 % 12
    @days = @days.zero? && @months.zero? ? 1 : @days
  end

  # Try to get first 4 numbers of generated hash
  def calculate_time(key)
    @calculate_time ||= Digest::SHA256.hexdigest(key)[/(\d{1,4})/, 1].to_i
  end
end
