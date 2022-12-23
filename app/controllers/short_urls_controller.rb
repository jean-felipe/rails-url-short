class ShortUrlsController < ApplicationController
  before_action :load_url, only: :show

  def index
    render json: ShortUrl.order(:redirects)
  end

  def create
    title = ShortUrlServices.generate_title(short_url_params[:original_url])

    short_url = ShortUrl.create(title: title, original_url: short_url_params[:original_url])
    short_url.shorted_url = ShortUrlServices.generate_short_url(short_url.id)

    if short_url.save
      render json: short_url, status: 201
    else
      render json: short_url.error.messages, status: 422
    end
  end

  def show
    @url.update(redirects: @url.redirects + 1)

    render json: @url
  end

  private

  def short_url_params
    params.require(:short_url).permit(
      :original_url
    )
  end

  def load_url
    if params[:code] == 'short_urls'
      @url = ShortUrl.order(:redirects)
    else
      @url = ShortUrl.find_by!(shorted_url: params[:code])
    end
  end
end
