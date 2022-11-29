class GistsController < ApplicationController

  def create
    gist = Gist.new(gist_params)
    gist.save!
  end
end
