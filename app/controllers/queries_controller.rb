class QueriesController < ApplicationController
  def index
    @queries = Query.all

  end
  def new
  end  
  def create
      @query = Query.new(query_params)
      
      @query.total = @query.calculate_total
    
      if !@query.check_valid
            flash[:message] = "Values cant be nil"
           redirect_to queries_url
       elsif !@query.check_vals 
           flash[:message] = "Values need to be greater than zero"
           redirect_to queries_url
          
       elsif @query.save
        flash[:total] = @query.total
        redirect_to queries_url
      else
        flash[:error] = errors.full_error_messages
        redirect_to queries_url
       #add redirection
      end  
  end

  def destroy
    if params[:id]!= "all"
      query = Query.find(params[:id])
      query.destroy
    else
      queries = Query.all
      queries.each do |q|
        q.destroy
      end
    end
    redirect_to queries_url
  end

  protected
  
   def query_params
      params.require(:query).permit(:principal, :rate, :years)
   end

end
