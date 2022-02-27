class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Pagy::Backend

  respond_to :json
end
