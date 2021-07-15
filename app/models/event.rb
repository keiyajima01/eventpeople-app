class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :type
  belongs_to_active_hash :pref
  has_many :tickets, dependent: :destroy
  has_one_attached :image, dependent: false
  attr_accessor :remove_image
  before_save :remove_image_if_user_accept

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :type_id
    validates :date_open
    validates :date_close
    validates :pref_id
    validates :place, length: { maximum: 64 }
  end
  validates :price, numericality: { message: "は数値で入力してください" }
  validates :price_detail, length: { maximum: 64 }
  validates :memo, length: { maximum: 200 }
  validates :image,
    content_type: [:png, :jpg, :jpeg],
    size: { less_than_or_equal_to: 10.megabytes },
    dimension: { width: {maxx: 2000 }, height: { max: 2000 } }

  private

  def date_open_should_be_before_date_close
    return unless start_at && end_at

    if date_open >= date_close
      errors.add(:date_open, "は終了よりも前に設定してください")
    end
  end

  def remove_image_if_user_accept
    self.image = nil if ActiveRecord::Type::Boolean.new.cast(remove_image)
  end
end
