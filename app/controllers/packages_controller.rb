class PackagesController < ApplicationController
  def index
    matching_packages = Package.all

    @list_of_packages = matching_packages.order({ :created_at => :desc })

    render({ :template => "packages/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_packages = Package.where({ :id => the_id })

    the_package = matching_packages.at(0)

    render({ :template => "packages/show" })
  end

  def create
    the_package = Package.new
    the_package.description = params.fetch("query_description")
    the_package.arrival_date = params.fetch("query_arrival_date")
    the_package.details = params.fetch("query_details")
    the_package.status = false

    if the_package.valid?
      the_package.save
      redirect_to("/packages", { :notice => "Added to list." })

    else
      redirect_to("/packages", { :alert => the_package.errors.full_messages.to_sentence })

    end
  end

  def received
    the_package_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_package_id }).at(0)
    the_package.status = true
    the_package.save

    redirect_to("/packages", { :notice => "Marked as received." })
  end

  def update
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.description = params.fetch("query_description")
    the_package.arrival_date = params.fetch("query_arrival_date")
    the_package.details = params.fetch("query_details")

    if the_package.valid?
      the_package.save
      redirect_to("/packages/#{the_package.id}", { :notice => "Package updated successfully."} )
    else
      redirect_to("/packages/#{the_package.id}", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.destroy

    redirect_to("/packages", { :notice => "Package deleted successfully."} )
  end
end
