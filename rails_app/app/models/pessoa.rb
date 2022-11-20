class Pessoa < ApplicationRecord

    attr_reader :status

    def feliz!
        @status = "Sentindo-se feliz!"
    end

    def triste!
        @status = "Sentindo-se triste!"
    end

    def luto!
        @status = "luto!"
    end

end
