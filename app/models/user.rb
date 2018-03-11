class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # before_create :set_user_type
  after_initialize :set_defaults
  after_save :create_types  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :admin, dependent: :destroy
  has_one :committee_member, dependent: :destroy
  has_one :researcher, dependent: :destroy
  has_one :dean, dependent: :destroy
  has_one :committee_head, dependent: :destroy
  validates :first_name, :last_name, :rank, :department, :contact_number, presence: true

  def set_defaults
  	self.first_name ||= ''
  	self.last_name ||= ''
  	self.department ||= ''
  	self.rank ||= ''
  	self.contact_number ||= ''
    self.curr_type = 'Researcher' if self.curr_type.nil?
  end

  def create_types
    self.create_committee_member!(user_id: self.id) if self.committee_member.nil?
    self.create_admin!(user_id: self.id) if self.admin.nil?
    self.create_dean!(user_id: self.id) if self.dean.nil?
    self.create_committee_head!(user_id: self.id) if self.committee_head.nil?
    self.create_researcher!(user_id: self.id) if self.researcher.nil?
  end

  def full_name
    self.last_name + ', ' + self.first_name
  end
end