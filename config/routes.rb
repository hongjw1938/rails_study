Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get '/home/index' => 'home#index'
  #post '/home/index' => 'home#create'
  root 'home#index'
  get '/lotto' => 'home#lotto'
  get '/lunch' => 'home#lunch'
  
  # 전체 유저 정보
  get '/users' => 'user#index'
  
  # 새 유저 등록폼
  get '/users/new' => 'user#new'
  
  # 한 명의 user를 보여줌
  get '/user/:id' => 'user#show'
  
  
  
  # 등록 확인
  post '/user/create' => 'user#create'
  
  
  ## 로또
  get '/lotto/new' => 'lotto#new'
  get '/lotto/index' => 'lotto#index'
  
  # 질문
  get '/ask' => 'ask#index'
  get '/ask/new' => 'ask#new'
  post '/ask/create' => 'ask#create'
  
  
  get '/ask/:id/delete' => 'ask#delete'
  get '/ask/:id/edit' => 'ask#edit'
  post '/ask/:id/update' => 'ask#update'
  
  get '/ask/:id' => 'ask#show'
end
