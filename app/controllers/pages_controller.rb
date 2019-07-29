class PagesController < ApplicationController
    def index
        @accommodations = Accommodation.all
    end

    def about
    end
    
    def upgrade
        @profile = current_user.profile
    end
end
