class UserController < ApplicationController
    def index
        # DB조작에는 User를 사용
        # all의 경우 전체를 불러옴
        # row 전체를 안에 넣음
        @users = User.all
    end
    
    def new
        
    end
    
    def show
        # 한 명을 찾음.
        @user = User.find(params[:id])
    end
    
    def create
        # 유저 생성
        u1 = User.new
        u1.user_name = params[:user_name]
        u1.password = params[:password]
        u1.save
        
        redirect_to "/user/#{u1.id}"
    end
end
