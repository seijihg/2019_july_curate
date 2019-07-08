class ExhibitionsController < ApplicationController
    def index
        @exhibitions = Exhibition.most_likes
    end
end
