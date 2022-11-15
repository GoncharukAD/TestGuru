class Admin < User

  validates :fisrt_name, presence: true
  validates :last_name, presence: true

end
