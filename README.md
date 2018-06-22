##  RAILS
### 1. 기본 설치
    * C9에서 사용하기 위해 cd ..로 최상위로 이동한다.
    * 설치
        - gem install rails -v 5.0.6 : rails 5.0.6버젼 설치
        - rvm install 2.4.1 : version manager를 이용해 ruby 2.4.1설치
        - rvm default 2.4.1 로 기본 버젼 지정 가능
        - rails _5.0.6_ new test_app : 프로젝트 생성(test_app이름으로)
    * 서버 동작시
        - 우상단의 Run Project는 workspace를 기반으로 되어 있음
        - rails s -b $PORT -o $IP : 실행
### 2. 기본
    * gem
        - ruby가 사용하는 library
    * bundler : 설치 --> gem install bundler
        - 내 프로젝트에 사용될 모든 gem을 자동으로 설치함
        - 해당 gem은 Gemfile에 명시한다.
        - Gemfile에 사용할 gem을 명시한 이후 터미널에 다음 명령어 입력
            >> `bundle install`
            >> 해당 명령어는 사용할 라이브러리를 추가한 이후에도 반드시 해당 명령어를 실행
            >> 사용할 gem을 지우더라도 해당 명령어를 다시 수행해야 한다. 그래야 삭제됨
    * rails 파일
        - 실행되는 것이 모두 분리되어 있음.
        - test_app/app
            >> models, views, controllers
        - config/routes.rb : action에 따른 어떤 logic을 수행할지 명시함
            >> 클라이언트의 요청이 들어오면 어떤 controller의 action을 수행할지 지정함.
            >> 아래와 같이 설정이 된다.
                --> class __controller
                        def action_name
                        end
                    end
        - db/ : ORM이용해 db 설정
        - log : 로그파일. 각종 로그가 저장됨
        - public : 외부에서 모두가 접근가능한 폴더
        - test : rails의 프레임워크는 TDD(Test Driven Development)에 최적화되어 있음. 즉, test에 어떤 기능을 구현할지 명시할 수 있다.
        - tmp : 임시파일 저장
        - vendor : template 지정
        - Gemfile : gem관리
            >> `gem 'gem이름', '~> version'`과 같이 입력한다.
        - Gemfile.lock : 설치된 dependencies 확인
    * rails client - server 요청 관계
        - 하단 이미지 확인
            >> Routes는 config/routes.rb
            >> DBMS --> db/
    * cf)ORM
        - ORM : db에 만들 table의 column등의 설정진행
        - ORM : Object Relational Mapping : 객체와 관계형 DBMS간의 매핑을 지원해주는 Framework
    * rails mode
        - Development
            >> 변경사항이 자동적으로 확인되고, 모든 로그가 찍힌다.
        - Test
        - Productionr
            >> 변경사항이 자동적으로 저장되지 않음. 로그도 일부만 찍힌다.(낮은 level). `$ rails s`로 서버를 실행하지 않는다.
    ** gems
        * bootstrap
            - getbootstrap.com에서 bootstrap gem을 사용하기 위한 방법이 설명되어 있다.
                >> `class`를 이용하여 css를 입힐 수 있음.
            - gemfile에 `gem 'bootstrap', '~> 4.1.1'`과 같이 하고 command에 bundle install을 하면 설치된다.
            - 이후, app/assets/stylesheets/application.scss에서 `@import "bootstrap";`으로 import할 수 있다.
            - 만약 scss가 아니고 css면 단순히 rename할 것
            - 이 부트스트랩을 통해 Grid system을 이용하면 반응형 웹(사이즈에 따라 자동으로 조정)을 쉽게 구현할 수 있다.
                >> app/views/layouts/application.html.erb에 다음 코드를 추가한다.
                >> `<meta="viewport" content="width=devide-width, initial-scale=1, shrink-to-fit=no">`
            * Grid System
                - 12부분으로 나누어서 화면을 조정할 수 있다.
        * geocoder
            - ip를 기반으로 위치를 알려주는 gem
            - Gemfile에 gem 'geocoder'로 설치 가능
            - request.location : 위치 정보, request.location.region : 지역 정보
    ** HTTP method
        * get
        * post
        * put : 수정시 사용, 일부 브라우저에서는 지원하지 않음. 따라서 patch와 같이 route시킴, 전체 데이터를 교체함. 모든 필드를 항상 새로운 값으로
        * patch : 수정시 사용, 부분 데이터를 업데이트 함.
        * delete : 서버에 리소스 삭제 요청
    * ruby code
        - `p / puts`
            >> `p` : 내부 구조까지 전부 보여줌
            >> `puts` : 객체를 보여줌
    * rails c
        * rails command를 불러오는 명령어
        * 코드
            - 객체 존재여부, 내용이 비어있는지 여부 확인하려면?
                >> `nil?`
                >> `present?`
                >> `empty?`
            - 객체 일치여부
                >> `eql?`
    * rails method
        cf) 아래의 !, ?와 같은 경우는 필수는 아니고, 명시적인 표시를 할 때 사용한다.
            - 특정 메소드의 경우에는 작동은 같으나 결과가 다를 수 있다!(ex- gsub)
        - ?
            >> return 값이 `true`, `false`인 경우에 이와 같이 명명한다.
            >> `def user_signed_in?`
               `end`
        - !(bang)
            >> 의도하지 않은 액션이 발생할 수 있는 메소드에 붙여준다.
        - private
            >> controller의 특정 구간에 private을 써놓으면 그 아래 쪽 method는 전체가 private으로 다른 곳에서 호출할 수 없다.
![이미지](./readme_img/mvc.JPG)
<a href="http://getbootstrap.com/docs/4.1/getting-started/download/">부트스트랩 정보 참조</a>
### 3. MVC
    * Controller
        - 역할?
            >> 서비스 로직을 가짐.
            >> 모델과 뷰를 연결해준다.
        - 규칙
            >> 모델, 뷰에 대해 알고 있어야 한다. 모델과 뷰는 서로에 대해서 알 수 없다.
            >> 모델, 뷰의 변경에 대해 인지하고 있어야 한다.
        - app.rb에서 작성한 모든 내용이 `Controller`에 들어간다.
        - `Controller`는 하나의 서비스에 대해서만 작성함.
        - `Controller`를 만들 때에는 `$ rails g controller 컨트롤러명` 을 이용한다.
            >> ex) 아래 스샷 참조
                `$rails g controller home`
                `# app/controllers/home_controller.rb 파일 생성됨`
                `class HomeController < ApplicationController >> 상속`
            >> 모든 `Controller`는 `ApplicationController`를 상속받는다. (상단의 코드는 상속 코드)
            >> `HomeController`에서 액션(`def`)를 작성하면 해당 액션명과 일치하는 `view`파일을 *app/views/home*폴더 밑에 작성한다.
            >> 사용자의 요청을 받는 url설정은 *config/routes.rb*에서 수행된다.(아래 이미지 참조)
            >> 이제는 erb :xxx 와 같은 코드는 필요가 없다. 자동 매핑
        - routes.rb
            >> get/post방식을 간단히 mapping가능함.
            >> root keyword를 통해 root디렉토리로 연결시 매핑을 할 수 있다.
        - parameter 사용
            >> `params[:parameter명]`으로 parameter value를 인식할 수 있다.
            * find함수로 db 검색(약 4가지)
                >> 특정 column을 사용해 찾기를 원하는 경우 : `find_by_user_name(params[:parameter명])`과 같이 찾을 수 있다.
                1. `Model.find(id)`
                    >>  이 방식은 인덱싱이 되어 있는 컬럼을 이용하는 것. 검색속도가 매우 빠르며 항상 고유한 값을 가진다.
                    >> `find`함수를 사용하여 db에서 검색할 parameter지정 가능
                2. `Model.find_by_컬럼명(value)`
                    >> 사용자가 입력했던 값으로 검색해야 하는 경우
                    >> 게시글 검색시, 작성자, 제목 등으로 검색하는 경우
                    >> `find_by`의 특징 : `1개만 검색된다.
                3. `Model.where(컬럼명: 검색어값)`
                    >> ex) `User.where(user_name: "hello")`
                    >> 결과 값이 여러개. 배열형태. 일치하는 값이 없는 경우에도 빈 배열이 나옴(실제 배열이 아니라 duck typing)
                    >> 따라서 `nil?`로 검색하면 `false`값을 얻을 수 있다.
                4. `Model.where("컬럼명 LIKE ?", "%#{value}%")`
                    >> ex) `User.where("user_name LIKE ?", "%h%")`
                    >> `Model.where("컬럼명 LIKE '%#(value)%'")` : 가능한 방식이지만 사용해선 안된다.
                        - 사용하면 안되는 이유??
                            >> 즉각적인 SQL Injection이 가능해진다.(보안에 취약한 구조). 즉, 사용자가 SQL문을 통해 직접 쿼리가 가능해진다.
                    >> 텍스트(string, text type)가 특정 단어, 문장을 포함하고 있는가를 검색
                    >> 다만, 이 방식은 Full table scan으로 오래 걸리는 방식이다.
                    >> 이에 따라, Full text search라는 방식을 사용하기도 함.(찾아볼것)
    * Model(아래 스샷 참조)
        - 생성
            >> `$ rails g model 모델명`
            >> *app/models*아래에 파일이 생성된다.
            >> 생성된시간_create_모델명s.rb로 파일이 생성되고 여기에 table을 생성하기 위한 코드를 작성할 수 있다.
        - 역할
            >> 데이터를 가진 객체
        - 규칙
            >> 사용자가 편집하고자 하는 모든 데이터를 가지고 있어야 한다.
            >> 뷰 또는 컨트롤러에 대해 어떠한 정보도 알지 못한다.
            >> 변경이 일어나면, 변경에 대해 통지할 수 있는 방법을 구현해야 한다.
        - command
            >> `rake db:migrate` : 스키마 및 sql문장 생성. 모델명에 맞는 table이 생성된다.
            >> `rails c`를 통해 rails command를 불러올 수 있다.
            >> migrate가 된 이후에 Users라는 클래스 객체를 생성할 수 있고, 이를 변수에 저장할 수 있다.
            >> 해당 변수에 저장하는 방식은 `u1 = User.new`와 같이 생성(row추가)하며, `u1.save`하면 자동으로 table에 user가 추가된다.
            >> `u1.user_name = ""`처럼 table내의 column value를 지정할 수 잇으며 ORM방식에 의해 자동적으로 SQL문을 생성하여 table에 저장된다.
            >> `u1.save`를 통해 sql문 실행 가능.
            >> 만약 table에 추가적으로 schema를 수정하고 싶은 경우 rb파일에 `t.string = "email"` 과 같이 가능할 것이다.
            >> 이 경우 수정을 위해서 `rake db:drop`을 통해 drop하고 다시 migrate해야 한다.(이전의 데이터는 모두 날아간다.)
            >> 따라서 부득이하게 db를 수정해야 할 경우에는 add_column, add_index등의 명령을 통해서 추가해야 한다.
            >> *app/models/모델명.rb*에는 아무런 내용이 없지만 ApplicationRecord를 상속함으로써 기능을 사용할 수 있다.
        - column
            >> string : 256자까지 가능
            >> text : 대략 12000자 까지 가능
    * View
        - 생성
            >> touch
        - 역할
            >> Client에게 보여줄 Front page
        - 규칙
            >> 액션과 뷰 파일의 이름은 반드시 일치시켜야 한다.
## Controller---------------------------------------------------------------------------------------------------            
![이미지](./readme_img/after_command.JPG)            
![이미지](./readme_img/home_controller.JPG)            
![이미지](./readme_img/route_file.JPG)                            
## Model--------------------------------------------------------------------------------------------------------
![이미지](./readme_img/make_model.JPG)
![이미지](./readme_img/ORM_model.JPG)
### 4. 유저등록 및 유저정보 가져오기
    * 진행
        - user controller생성 : `rails g controller user`
        - controller에 함수 생성 후 action을 연결(routes.rb에 mapping)
        - controller에는 create, new, users등 각 로직을 구성
            * 로직
                >> index에는 모델명.all을 통해 전체 row의 정보를 읽어올 수 있다.
                >> show에는 모델명.find를 통해 하나의 row의 정보를 찾아 읽어올 수 있다.
                >> create에는 new, save등으로 유저 정보를 생성할 수 있다.(개인 유저 정보를 볼 수 있는 곳으로 redirect : redirect_to사용)
                >> 
        - POST방식 rails 요청시
            >> POST방식으로 정보를 요청하게 되면 단순히 요청시에 rails에서는 오류가 난다.
            >> 안정성 및 보안을 높이기 위해서 특정한 토큰을 정보 요청시 같이 전달해야만 한다.
            >> <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
            >> 해당 token의 경우도 전달될 때마다 지속하여 변경된다.
            >> 물론 application_controller에서 protect부분을 주석처리해도 되지만 그 경우 보안이 나빠진다.
    * 요청 정보 확인 하기
        - controller에 `p request`와 같이 작성하면 action이 실행될 때 유저의 요청 정보를 서버로그에 나타낼 수 있다.
            >> `request`객체를 써내려갈 수 있다. .연산자를 이용해 속성을 뽑아낼 수 있다.
            >> 만약 IP정보를 뽑아내고 싶다면 `p request.ip`로 하면 된다.
    * 요청 정보 삭제하기
        - find함수를 이용해 parameter로 전달되는 value에 맞는 객체를 찾는다.
        - destroy메소드로 삭제 가능
    * 수정하기
        - find로 찾은 다음 다른 내용으로 변경한 다음 save한다.
### 5. form helper 
    * 개념
        - *ruby tag*로 *html*코드를 작성할 수 있는 코드
        - view helper의 일종
        - 참조 : http://guides.rubyonrails.org/form_helpers.html
    * 예시
        >> input 태그
            * submit
                - `<%= submit_tag("tweet") %>`
                - `<input type="submit" value="tweet">`
            * password
                - `<%= password_field_tag(:password) %>`
        >> textarea 태그
            - `<%= text_area_tag(:contents, params[:contents], placeholder: "What's happening?", size: "24x6") %>`
            - `<textarea placeholder="What's happening?"></textarea>`
        >> a 태그
            - `<%= link_to "새글 쓰기", :method => 'get'%>`
        >> form 태그
            - `<%= form_tag("/경로", method: "put")`
            - form helper에서 form태그는 post가 default이다.
### 6. cookie / session
    * cookie
        - 서버와 클라이언트가 요청하는 정보는 독립적으로 작용한다.
        - 이 독립적인 부분을 보완하기 위한 것이 cookie(특정 정보는 저장하여 유지할 필요가 있다.)
        - cookie에는 서버 및 클라이언트가 삭제하거나 브라우저가 종료되기 전에는 정보가 유지된다.(웹 브라우저가 저장한다)
        - 쿠키는 사용자가 웹 사이트를 처음 방문할 때 웹 사이트에서 사용자 컴퓨터의 하드 디스크에 저장해 놓는 작은 파일.
        - *웹 서버는 웹 브라우저가 전송한 쿠키를 사용해 필요한 데이터를 읽을 수 있다.*
        - *HTTP 쿠키란 서버가 사용자에 웹 브라우저에 전송하는 작은 데이터 조각으로, 브라우저는 그 데이터 조각을 저장할 수 있고 동일한 서버로 다음 요청 시 함께 전송한다.*
            >> 이에 따라, 동일한 유저인지 아닌지 확인할 수 있다.
            >> 쿠키는 상태가 없는(statless) HTTP 프로토콜에서 상태 기반 정보를 기억한다.
        - flash정보 또한 cookie. : 휘발성이므로 정보가 전달된 이후에는 사라짐.
        * 목적  
            - 세션 관리
            - 개인화
            - 트래킹
        * 사용
            - `cookies` hash 타입을 사용해 설정 가능
            - `flash` hash 타입을 사용해 설정 가능
    * session
        - session id를 생성하여 server memory에 저장.
        - F12 - application에 보면 암호화되어 저장되어 있는 것을 확인 가능
        - 즉, 클라이언트 및 서버 양단에서 저장한다.(cookie는 클라이언트에서 저장)
        - 독립적인 request, response가 전달되는 웹 환경에서 정보를 지속적으로 저장하기 위해 쿠키를 사용했으나 이는 위조가 가능하고 안전하지 않다.
        - 따라서, 서버에 정보를 저장하고 해당 위치, 즉 session ID를 생성해 client에 저장하여 정보를 유지한다.
        - `session` hash 타입을 사용해 설정 가능 : `session[:user_id]`
        - `session` hash 타입은 매우 방대한 정보를 저장하고 있음.
        - 구현한 내용은 daum_cafe_app 부분 참조
### 7. daum_cafe_app 만들기
    ** rails app 생성
        - rails _5.0.6_ new name
        * 모델 생성
            - rails g model post
        * controller 생성
            - rails g controller board index show new edit
            - 뒤의 parameter를 주면 view파일도 동시에 생성가능
    * route 지정
        - RESTful 한 방식으로 지정할 것.
        - 수정 : put, patch
        - 삭제 : delete
    * 세션을 이용한 로그인 시스템 만들기
        - `session[:지정hash]` : 이를 이용해 특정 hash key에 value를 저장할 수 있다.
        - 일반적으로 고유한 id를 찾을 수 없으므로 login을 구현시, id를 이용해 찾아야 한다.
            >> 유저가 존재하는지 확인하기 위해 `nil?`을 사용. 비밀번호 일치 여부 확인을 위해 `eql?`사용
            >> 검색한 내용을 활용시 `empty?`를 사용해 비어있는지 확인할 수 있다.
            >> 존재여부를 묻는 경우 `present?`를 사용할 수도 있다.
            `user.present?`
            >> `find_by_column명(params[:parameter명])`으로 찾는다.
        - id를 찾아서 db에 저장된 객체를 찾았으면 해당 id에 따른 고유한 값을 `session[:current_name]`과 같이 hash타입에 저장한다.
        - 이에 따라 현재 로그인된 유저 정보를 index에 보여줄 수 있다.
            >> `model명.find(session[:current_name]) if session[:current_name]`으로 찾고 변수에 저장해 사용할 수 있다.
    * 코드 줄이기
        - 동일한 코드의 반복을 줄일 필요가 있다. 하나의 메소드로 관리
            >> `def set_post`
                   `@post = Post.find(params[:id])`
                `end`
            >> 위와 같이 하나의 메소드로 코드를 지정하면 하나의 요청에서는 해당 값이 유지되어 사용된다.
            >> 이러한 사용방식을 택할 경우, 변수는 다른 곳에서도 반드시 일치시켜야 한다.
            >> 그러나 코드 중복 자체는 줄일 수 없음.
            >> 따라서, filter를 사용해 코드 중복을 줄일 수 있다.
        - filter??
            >> Filters are methods that are run "before", "after" or "around" a controller action.
            >> `before_action :require_login`와 같이 사용할 수 있다.
            >> 그러나 모든 action에 대해 지정하면 오류가 날 수 있으므로, 특정 경우에만 사용토록 해야 한다.(only)
            >> `before_action :set_post, only: [:show, :edit, :update, :destroy]`
            >> `before_action :set_post, except: [:index, :new, :create]` : 이와 같이 제외하는 방식으로 사용해도 된다.
        - application_controller이용
            >> 현재 로그인된 유저 확인, 로그인 상태 확인 메소드 생성
            >> 어디서든 메소드를 불러 즉각적으로 사용할 수 있음.
            >> 따라서 해당 코드를 다른 컨트롤러에서 사용 가능.
            >> 이를 통해 특정 액션의 경우 로그인된 상태에서만 입장할 수 있게 하려면?
                `def authenticate_user!`
                `   unless user_signed_in?`
                `    redirect_to '/sign_in'`
         
                `    end`
                `end`
            >> 위와 같이 메소드를 지정한 다음 board_controller에 filter를 사용
                `before_action :authenticate_user!, except: [:index, :show]`
            >> View file에서 controller에 있는 action을 사용하기 위해 시도하는 경우
                - 단순히 사용하면 선언되지 않은 메소드라고 오류를 내보낸다.
                - Cycle상, controller에 있던 메소드를 거쳐서 view로 넘어온 것이기 때문에 다시 돌아가서 확인할 수가 없는 것이다.
                - 따라서, helper_method를 사용한다.
                - `helper_method :메소드명` 과 같이 사용할 수 있다.
    * 한명의 유저가 여러 글을 작성(1:n 구조 구현)
        - 유저가 1이고 글(post)가 n이다. 따라서 다음과 같이 rb file에 작성할 수 있다.
            >> user.rb에 넣을 코드 : `has_many :posts`
            >> post.rb에 넣을 코드 : `belongs_to :users`
            >> 반드시 복수형으로 지정해야 한다.
        - db를 변경한다. 모델명_id를 통해 foreign key를 지정할 수 있다.
            >> `t.integer :user_id`
            >> 위와 같이 posts table에 칼럼을 추가하여 외래키를 지정할 수 있다.
            >> 외래키 지정시에는 `:foreign_key true`로 속성을 줄 수 있지만, 만약 table이 post가 먼저 만들어지고 user가 이후에 만들어지는 경우에는 불가능.
            >> rails c를 통해 command하고 특정 유저를 만들고 post객체를 만든 다음 post를 채워넣고
                ->> `u.posts`, `p.user`를 통해 user가 작성한 post들, post를 작성한 user 정보를 확인할 수 있다.
        - 이에 따라 controller에서 post를 create할 때마다 user의 id를 저장해야 한다.
            >> `post.user_id = current_user.id`로 application_controller에 있는 current_user메소드를 호출하고
            >> 세션에 저장된 user_id를 통해 User모델에서 객체를 찾고 고유한 해당 id값을 저장한다.
        - 위 과정으로 외래키를 지정할 수 있으며, user / post를 연결해 각각에 대해 쿼리할 수 있다.