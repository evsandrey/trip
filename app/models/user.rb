# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  nickname               :string           default(""), not null
#  slogan                 :string           default(""), not null
#  name                   :string           default(""), not null
#  surname                :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pictures
  has_many :trophy

  has_and_belongs_to_many :trips, :uniq => true, :join_table => :users_trips
  has_and_belongs_to_many :commands


  has_attached_file :avatar,
  	styles: { menu: "20x20#", thumb: "50x50#", med: "300x300"},
  	:path => "trip-site/avatars/:id/:style.:extension",
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
