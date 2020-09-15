class ApplicationController < ActionController::API
    def success_response(err,body,status=200)
        render json:{err: err , body: body}, status: status
    end
    
end
