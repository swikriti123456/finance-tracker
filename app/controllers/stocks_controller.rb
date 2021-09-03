class StocksController < ApplicationController

	def search
		if params[:stock].present?
			@stock = Stock.new_lookup(params[:stock])
			if @stock
				respond_to do |format|
					format.js {render partial: 'users/result'}
				end
				
			else
				respond_to do |format|
					flash.now[:alert] = "please enter vaid symbol"
					format.js {render partial: 'users/result'}
				end
				
			end
		else
			respond_to do |format|
				flash.now[:alert] = "please enter something to search"
				format.js {render partial: 'users/result'}
			end
		end
	end
end