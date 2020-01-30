class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :projects, dependent: :destroy
  has_many :users_todos,  dependent: :destroy
  has_many :todos, through: :users_todos
  scope :all_except, ->(user) { where.not(id: user) }
end
