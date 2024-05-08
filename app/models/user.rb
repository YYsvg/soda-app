class User < ApplicationRecord
  has_many :incomes
  has_many :outcomes
  has_many :wants

  validates :name,   presence: true
  validates :role,  inclusion: {in: [true, false]}

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  def social_plofile(provider)
    social_plofile.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
    credentials = omniauth["credentials"]
    info = omniauth["info"]

    access_token = credentials["refresh_token"]
    access_secret = credentials["secret"]
    credentials = credentials.to_json
    name = info["name"]
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end

  def admin?
    role == true
  end

  # エラーになる　'1' is not a valid role
  # enum role: { general: false, admin: true }
  # enum role: { general: 0, admin: 1 }

  scope :created_days_sqlite, -> { user.group("strftime('%Y-%m-%d', created_at, '+09:00')").pluck(:created_at) }
  scope :created_days_mysql, -> { user.group("date_format(updated_at + interval 9 hour, '%Y-%m-%d')").pluck(:updated_at) }

end
