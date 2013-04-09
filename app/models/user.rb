# -*- coding: utf-8 -*-
class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :encryptable

  attr_accessible :name, :email, :avatar, :password, :password_confirmation, :remember_me
  
  ## Database authenticatable
  field :name,              :type => String, :default => ""
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :encrypted_password

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Encryptable
  field :password_salt, :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  
  mount_uploader :avatar, AvatarUploader

  validates_presence_of :name,
    message: "请输入用户名"
  validates_format_of :name, 
    with: /^[0-9a-zA-Z\u4e00-\u9fa5]+$/i, 
    message: "名字中不能包含特殊字符"
  validates_length_of :name,
    within: 1..40,
    too_short: "最少%{count}个字",
    too_long: "最多%{count}个字"
  validates_uniqueness_of :name, 
    case_sensitive: false, 
    message: "此用户名已被使用"
  validates_length_of :name,
    within: 1..40,
    too_short: "最少%{count}个字",
    too_long: "最多%{count}个字"

  before_create :no_password_confirmation

  def no_password_confirmation
    self.password_confirmation = self.password
  end
end
