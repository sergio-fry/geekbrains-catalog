class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  # GET /items or /items.json
  def index
    @items = Item.all.with_attached_images
  end

  # GET /items/1 or /items/1.json
  def show
    # @comments = Comment.where(commentable: @item)
    @sorted_comments = sorted_comments Comment.where(commentable: @item)

    respond_to do |format|
      format.json { render json: ItemSerializer.new(@item).as_json }
      format.html
    end
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def sorted_comments(comments, id = nil, level = 0, result = [])
    comment = comments.find { |c| id ? c.id == id : c.parent_id.nil? }
    return unless comment

    result << {
      comment: comment,
      level: level
    }

    comments.select { |c| c.parent_id == comment.id }
      .each { |c| sorted_comments(comments, c.id, level + 1, result) }

    result
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:title, :category_id, :price, :new_image)
  end
end
