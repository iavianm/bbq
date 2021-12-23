class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event, presence: true
  validates :user, presence: true
  validates_format_of :photo, with: /([a-zA-Zа-яА-Я\-_0-9\/\:\.]*\.(jpg|jpeg|png|gif))/i

  mount_uploader :photo, PhotoUploader

  # Этот scope нужен нам, чтобы отделить реальные фотки от болванки
  # см. events_controller
  scope :persisted, -> { where 'id IS NOT NULL' }
end
