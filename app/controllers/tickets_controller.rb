class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tickets = Ticket.all
    respond_with(@tickets)
  end

  def show
    respond_with(@ticket)
  end

  def new
    @ticket = Ticket.new
    respond_with(@ticket)
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    # @ticket.save
    # respond_with(@ticket)
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to action: "index", notice: 'ticket was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end    
  end

  def update
    @ticket.update(ticket_params)
    respond_with(@ticket)
  end

  def destroy
    @ticket.destroy
    respond_with(@ticket)
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:location_id, :section, :row, :seat, :number, :link, :local, :asking, :sold)
    end
end
