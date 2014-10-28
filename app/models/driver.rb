class Driver < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable #,:validatable
  acts_as_votable
  letsrate_rateable "behaviour", "on_time", "price"

  has_attached_file :avatar, :styles => { :medium => "300x300>", :small => '50x50>', :thumb => "100x100>" }, :default_url => "",
    :url => "/images/avatars/:id/:style/:basename.:extension",
    :path => ":rails_root/public/images/avatars/:id/:style/:basename.:extension"


  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/,
                                    :size => { :in => 0..10*1024.kilobytes }

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  scope :sort_by_id, ->{order('drivers.id DESC')}
  scope :sort_by_name, ->{order('drivers.first_name ASC, drivers.last_name ASC')}

  validates :first_name, :presence => true,
                         :length => {:in => 4..20}

  validates :last_name, :presence => true,
                        :length => {:in => 4..20}

  validates :email, :presence => true,
                    :length => {:maximum => 255},
                    :format => EMAIL_REGEX

  validates :driver_license, :presence => true,
                             :length => {:maximum => 20},
                             :numericality => {only_integer: true}

  validates :gender, :numericality => {only_integer: true, greater_than: 0}

  validate :check_age_to_driver

  def score
    self.get_upvotes.size - self.get_downvotes.size  
  end

  private
  def check_age_to_driver
    if birthday.present? && ( (Date.today - birthday) / 365 ).floor < 18
      errors.add(:birthday, "You not enough age to driver")
    end
  end
end
