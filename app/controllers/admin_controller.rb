# frozen_string_literal: true

# AdminController
class AdminController < ApplicationController
  layout 'admin'
  ## AUTHENTICATION: DEVISE
  before_action :authenticate_user!

  ## AUTHORIZATION: CANCANCAN
  # authorize_resource class: false

  # rescue_from CanCan::AccessDenied do |_exception|
  #   flash[:error] = t('cancancan.permission_denied')
  #   redirect_back(fallback_location: root_path)
  #   # render action: :denied, layout: 'blank'
  # end
end
