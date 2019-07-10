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
        @like = Like.new
    end

    def show
      @exhibition = Exhibition.find(params[:id])
      @comment = Comment.new
      @like = Like.new
    end

    def new
      @exhibition = Exhibition.new
    end

    def create
      exhib = Exhibition.create(exhibition_params)
      if exhib.valid?
        redirect_to exhibition_path(exhib)
      else
        flash[:errors] = exhib.errors.full_messages
        render 'new'
      end
    end

    def edit
      @exhibition = Exhibition.find(params[:id])
    end

    def update
      @exhibition = Exhibition.find(params[:id])
      if @exhibition.update(exhibition_params)
          redirect_to @exhibition
      else
          render "edit"
      end
    end

    def destroy
      @exhibition = Exhibition.find(params[:id])
      @exhibition.destroy
      redirect_to exhibitions_path
    end


    private

    def exhibition_params
        params.require(:exhibition).permit(:title, :artist, :category, :gallery, :location, :date_end, :user_id)
    end

    def most_likes(array)
        array.sort_by { |exhibition| exhibition.likes.count}.reverse
    end
end
