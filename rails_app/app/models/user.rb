class User < ApplicationRecord

    #attr used by bcrypt, has to be an xxx_digest atrib to work
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    #To be executed just before save
    before_create { generate_token(:auth_token) }

    # Send a email containing a token for password reset request
    # which will expires after a couple times after
    def send_password_reset
       generate_token(:password_reset_token) 
       self.password_reset_sent_at = Time.zone.now
       save!
       UserMailer.password_reset(self).deliver
    end

    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
    end
end
