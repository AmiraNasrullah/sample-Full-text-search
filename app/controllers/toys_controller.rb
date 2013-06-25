class ToysController < ApplicationController
  # GET /toys
  # GET /toys.json
  def index
  @toys = Toy.search(params)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @toys }
    end
  end

  # GET /toys/1
  # GET /toys/1.json
  def show
    @toy = Toy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @toy }
    end
  end

  # GET /toys/new
  # GET /toys/new.json
  def new
    @toy = Toy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @toy }
    end
  end

  # GET /toys/1/edit
  def edit
    @toy = Toy.find(params[:id])
  end

  # POST /toys
  # POST /toys.json
  def create
    @toy = Toy.new(params[:toy])

    respond_to do |format|
      if @toy.save
        format.html { redirect_to @toy, notice: 'Toy was successfully created.' }
        format.json { render json: @toy, status: :created, location: @toy }
      else
        format.html { render action: "new" }
        format.json { render json: @toy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /toys/1
  # PUT /toys/1.json
  def update
    @toy = Toy.find(params[:id])

    respond_to do |format|
      if @toy.update_attributes(params[:toy])
        format.html { redirect_to @toy, notice: 'Toy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @toy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toys/1
  # DELETE /toys/1.json
  def destroy
    @toy = Toy.find(params[:id])
    @toy.destroy

    respond_to do |format|
      format.html { redirect_to toys_url }
      format.json { head :no_content }
    end
  end
end
