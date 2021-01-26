class RadiosController < ApplicationController
  def index
    @media = Radio.last
  end
end
