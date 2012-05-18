class ScansController < ApplicationController
  def create
    File.open "file.png", "wb" do |file|
      file.write Base64.decode64 params[:img_data]
      @upc = ZXing.decode file
    end

    product = Product.find_by_upc @upc
    if product
      render :json => product.to_json
    else
      render :json => { :msg => "Product not found" }.to_json, :status => "not_found"
    end
  end
end
