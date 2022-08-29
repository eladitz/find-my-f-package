class PackagesController < ApplicationController
  def received
  end

  def find
    @package = Package.new
  end
end
