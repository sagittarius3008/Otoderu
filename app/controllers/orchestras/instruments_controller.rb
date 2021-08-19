class Orchestras::InstrumentsController < ApplicationController
  include Nav
  before_action :new_apply

  def index
    @instruments = Instrument.all
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    if @instrument.save
      flash[:notice] = "新規楽器を登録しました"
      redirect_to request.referer
    else
      flash[:notice] = "入力内容を再度ご確認ください。"
      redirect_to request.referer
    end
  end

  def update
    instrument = Instrument.find(params[:id])
    if instrument.update(instrument_params)
      redirect_to request.referer
    else
      flash[:notice] = "入力内容を再度ご確認ください。"
      redirect_to request.referer
    end
  end

  private

    def instrument_params
      params.require(:instrument).permit(:name)
    end
end
