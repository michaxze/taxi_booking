class User < ActiveRecord::Base
  attr_accessor :mobileno, :password, :status
  validates :mobileno, uniqueness: true
  has_many :bookings

  STATUS = { :pending => 0, :active => 1, :deleted => 2 }

  class << self
    def create_user(user)
      user = User.create!(user)
    end

    def get_password(mobileno)
      user = User.find_by_mobileno(clean_number(mobileno))
      user['password']
    end

    def find_active_user(mobileno, password)
      user = where("mobileno = ? AND password = ? AND status = ?",
              clean_number(mobileno), password, STATUS[:active]).first
      user
    end

    def clean_number(mobileno)
      #TODO: format and clean number
      mobileno.to_s.strip
    end
  end

end
