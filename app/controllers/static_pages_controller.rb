class StaticPagesController < ApplicationController
  def thank_you
    render :thank_you
  end

  def too_early
    render :too_early
  end
end
