# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    validates :username, :session_token, presence: true
    validates :password_digest, presence: true { message: 'password can\'t be blank' }
    validates :password, length: {minimum: 6, allow_nil: true}

    def self.find_by_credentials(username, password)
        Self.find_by(username: Self[:username])
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

 private
    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end
end
