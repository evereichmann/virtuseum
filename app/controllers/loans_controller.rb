class LoansController < ApplicationController

    def new
        @loan = Loan.new
    end

    def create
        @exhibit = Exhibit.all
        @loan = Loan.create(loan_params)
        redirect_to exhibit_path(@loan.exhibit) 
    end

    def edit
        @loan = Loan.find(params[:id])
    end

    def update
        @loan = Loan.find(params[:id])
        @loan.update(loan_params)
        redirect_to exhibit_path(@loan.exhibit)
    end

    def destroy
        @loan = Loan.find(params[:id])
        @loan.destroy
        redirect_to exhibits_path
    end

    private

    def loan_params
        params.require(:loan).permit(:item_id, :exhibit_id)
    end
end
