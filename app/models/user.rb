class User < ApplicationRecord
  before_destroy :check_all_events_finish
  attr_accessor :remember_token
  has_many :events
  has_many :tickets, dependent: :nullify
  has_many :participating_events, through: :tickets, source: :event
  before_save { mail.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  with_options presence: true do
    validates :nickname, length: { maximum: 50 }
    validates :mail, length: { maximum: 250 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: "を全角で入力してください" } do
      validates :last_name
      validates :first_name
    end
    validates :address
  end
  has_secure_password

  def User.digest(string)            #selfを使用した記述もある
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                              BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token                #selfを使用した記述もある
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  private
  
  def check_all_events_finish
    now = Time.zone.now
    if created_events.where(":now < date_close", now: now).exists?
      errors[:base] << "公開中の未終了のイベントが存在します。"
    end

    if participating_events.where(":now < date_close", now: now).exists?
      errors[:base] << "見終了の参加イベントが存在します。"
    end

    throw(:abort) unless errors.empty?
  end
end
