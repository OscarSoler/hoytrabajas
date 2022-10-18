class BanksController < ApplicationController
  before_action :set_bank, only: %i[ show edit update destroy ]

  # GET /banks or /banks.json
  def index
    @banks = Bank.all
  end

  # GET /banks/1 or /banks/1.json
  def show
  end

  # GET /banks/new
  def new
    @bank = Bank.new
  end

  # GET /banks/1/edit
  def edit
  end

  # POST /banks or /banks.json
  def create
    @bank = Bank.new(bank_params)
	@banks = Bank.order("created_at DESC")

    respond_to do |format|
      if @bank.save
		flash.now[:success] = "Banco fue creado con éxito."
		format.turbo_stream { 
			render turbo_stream: [
				turbo_stream.update("flash", partial: "shared/flash"),	
				turbo_stream.update('banks-table', partial: 'banks/table', locals: {banks: @banks})
			]
		}
        format.html { redirect_to bank_url(@bank), notice: "Bank fue creado con éxito." }
        format.json { render :show, status: :created, location: @bank }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banks/1 or /banks/1.json
  def update
    respond_to do |format|
      if @bank.update(bank_params)
		flash.now[:notice] = "Banco se actualizó con éxito."
		format.turbo_stream { 
			render turbo_stream: [
				turbo_stream.replace(@bank, partial: "banks/bank", locals: {bank: @bank}),
				turbo_stream.update("flash", partial: "shared/flash")
			]
		}
        format.html { redirect_to bank_url(@bank), notice: "Bank se actualizó con éxito." }
        format.json { render :show, status: :ok, location: @bank }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banks/1 or /banks/1.json
  def destroy
	

    respond_to do |format|
		if @bank.destroy
			flash.now[:notice] = "Banco fue eliminado con éxito"
			format.turbo_stream { 
				render turbo_stream: [
					turbo_stream.remove(@bank),
					turbo_stream.update("flash", partial: "shared/flash")
				]
			}
			  format.html { redirect_to banks_url, notice: "Bank fue eliminado con éxito" }
			  format.json { head :no_content }
		else
			flash.now[:error] = "Bank cannot be deleted has associated providers"
			format.turbo_stream { 
				render turbo_stream: [
					turbo_stream.update("flash", partial: "shared/flash")
				]
			}
		end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank
      @bank = Bank.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_params
      params.require(:bank).permit(:name)
    end
end
