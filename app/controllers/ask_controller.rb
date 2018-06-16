class AskController < ApplicationController
    
    # 모든 질문을 보여줌
    def index
       @asks = Ask.all 
    end
    
    # 새로운 질문을 등록 페이지
    def new
        #p request.ip
        p request.location.region
    end
    
    
    # 새로운 질문을 저장
    def create
        ask = Ask.new
        ask.question = params[:q]
        ask.ip_address = request.ip
        ask.region = request.location.region
        ask.save
        
        redirect_to "/ask"
    end
    
    
    # 삭제
    def delete
        ask = Ask.find(params[:id])
        ask.destroy
        
        redirect_to "/ask"
    end
    
    def edit
        @ask = Ask.find(params[:id])
    end
    
    def update
        ask = Ask.find(params[:id])
        ask.question = params[:q]
        ask.save
        redirect_to '/ask'
    end
    
    def show
        @ask = Ask.find(params[:id])
    end
end
