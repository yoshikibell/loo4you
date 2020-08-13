class Owner::BookingsController < ApplicationController
  skip_after_action :verify_policy_scoped

  def index
    @bookings = current_user.bookings_as_owner
    @toilets = current_user.toilets
  end


end
