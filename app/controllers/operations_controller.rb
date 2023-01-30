class OperationsController < ApplicationController
  before_action :get_category
#  before_action :get_type
  before_action :set_operation, only: %i[ show edit update destroy ]

  # GET /operations or /operations.json
  def index
    @operations = Operation.all
  end

  # GET /operations/1 or /operations/1.json
  def show
  end

  # GET /operations/new
  def new
  #  @operation = Operation.new
    @operation = @category.operations.build
  #  @operation = @type.operations.build
    @categories = Category.all.map { |oc| [oc.name, oc.id] }
    @types = Type.all.map {|ot| [ot.name, ot.id] }
  end

  # GET /operations/1/edit
  def edit
    #@categories = Category.all
    #@types = Type.all    
    @categories = Category.all.map { |oc| [oc.name, oc.id] }
    @types = Type.all.map {|ot| [ot.name, ot.id] }
  end

  # POST /operations or /operations.json
  def create
   # @operation = Operation.new(operation_params)
   @operation = @category.operations.build
#   @operation = @type.operations.build
    respond_to do |format|
      if @operation.save
     #   format.html { redirect_to operation_url(@operation), notice: "Operation was successfully created." }
     format.html { redirect_to category_operation_path(@category), notice: "Operation in Category was successfully created."}
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1 or /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to category_operations_path(@category), notice: "Operation was successfully updated." }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1 or /operations/1.json
  def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to category_operations_path, notice: "Operation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_category
      @category = Category.find(params[:category_id])
    end

  #  def get_type
  #    @type = Type.find(params[:type_id])
  #  end

    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = @category.operations.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def operation_params
      params.require(:operation).permit(:amount, :odate, :description, :category_id, :type_id)
    end
end
