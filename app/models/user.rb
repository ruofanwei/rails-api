class User < ApplicationRecord
    # model association

    validates :username, presence: true
    validates :email,email: true
end
