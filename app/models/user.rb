# frozen_string_literal: true
class User < ApplicationRecord
  rolify
  has_paper_trail

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :active_subscription, -> {
    where(state: 'active')
  }, class_name: Payola::Subscription, inverse_of: :owner, foreign_key: :owner_id

  has_many :subscriptions, class_name: Payola::Subscription, inverse_of: :owner, foreign_key: :owner_id

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
