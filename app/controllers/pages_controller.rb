class PagesController < ApplicationController
    def index
        @accommodations = Accommodation.all
    end

    def about
    end
    
end
