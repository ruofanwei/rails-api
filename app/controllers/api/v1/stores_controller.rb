class Api::V1::StoresController < ApplicationController
    before_action :set_store, only: [:show, :update, :destroy]
  # GET /stores
  def index
    @stores = Store.all
    json_response(@stores)
  end

  # POST /stores
  def create
    @store = Store.create!(store_params)
    json_response(@store, :created)
  end

  # GET /stores/:id
  def show
    json_response(@store)
  end

  # PUT /stores/:id
  def update
    @store.update(store_params)
    head :no_content
  end

  # DELETE /stores/:id
  def destroy
    @store.destroy
    head :no_content
  end

  private

  def store_params
    # whitelist params
    params.permit(:name, :created_at)
  end

  def set_store
    @store = Store.find(params[:id])
  end

end
