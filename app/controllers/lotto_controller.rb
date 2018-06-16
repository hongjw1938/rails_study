class LottoController < ApplicationController
    def index
        @new_lotto = Lotto.last
        @lottos = Lotto.all
    end
    
    def new
        
        l1 = Lotto.new
        l1.numbers = (1..45).to_a.sample(6).sort.to_s
        
        l1.save
        
        redirect_to '/lotto/index'
    end
end
