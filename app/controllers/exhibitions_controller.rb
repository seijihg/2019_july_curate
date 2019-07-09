class ExhibitionsController < ApplicationController
    helper_method :most_likes
    
    def index
        if !params[:exhibition].nil?
            if params[:exhibition].each {|hash| hash}.all? {|k, v| v == ""}
                @exhibitions = Exhibition.all
            else
                @exhibitions = Exhibition.filter(exhibition_params(:title, :category, :location))
                @exhibitions = @exhibitions.nil? ? @exhibitions = Exhibition.all : @exhibitions
                if !@exhibitions.kind_of?(Array)
                    empty = []
                    empty << @exhibitions
                    @exhibitions = empty
                end
            end
        else 
            @exhibitions = Exhibition.all
        end
        @locations = Exhibition.locations
        @galleries = Exhibition.galleries
        @categories = Exhibition.categories
        @selected_loc = params[:exhibition].nil? ? "" : params[:exhibition][:location]
        @selected_cat = params[:exhibition].nil? ? "" : params[:exhibition][:category]
        @selected_gal = params[:exhibition].nil? ? "" : params[:exhibition][:gallery]
    end

    private

    def exhibition_params(*args)
        params.require(:exhibition).permit(*args)
    end

    def most_likes(array)
        array.sort_by { |exhibition| exhibition.likes.count}.reverse
    end
end
