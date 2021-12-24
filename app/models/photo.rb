class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event, presence: true
  validates :user, presence: true
  validates :photo, presence: true, format: /[a-zA-Zа-яА-Я\-_0-9\/\:\.]*/i

  mount_uploader :photo, PhotoUploader

  # Этот scope нужен нам, чтобы отделить реальные фотки от болванки
  # см. events_controller
  scope :persisted, -> { where 'id IS NOT NULL' }
end
