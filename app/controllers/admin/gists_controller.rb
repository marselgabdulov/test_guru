module Admin
  class GistsController < ApplicationController
    def index
      @gists = Gist.all
    end
  end
end
