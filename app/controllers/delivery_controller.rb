class DeliveryController < ApplicationController
  def index
    render({ :template => "delivery/index" })
  end
end
