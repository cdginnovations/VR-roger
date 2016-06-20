class User < ActiveRecord::Base

  has_attached_file :profile, styles: {
   thumb: '100x100>',
   square: '200x200#',
   medium: '300x300>'
 }

 has_attached_file :banner, styles: {
  thumb: '100x100>',
  square: '200x200#',
  medium: '300x300>'
}

 # Validate the attached image is image/jpg, image/png, etc
 validates_attachment_content_type :profile, :content_type => /\Aimage\/.*\Z/
 validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  enum role: [:admin, :user, :trainee, :author, :coach, :manager]
  after_initialize :set_default_role, :if => :new_record?
  #  persisted? instead of new_record?

  def set_default_role
    self.role ||= :user
  end

  has_many :courses
  has_many :chapters, :through => :courses
  has_many :lessons, :through => :chapters
  has_many :practices
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
end
