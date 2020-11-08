class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise(
        :database_authenticatable, 
        :registerable, 
        :recoverable, 
        :rememberable, 
        :validatable,
        :omniauthable, omniauth_providers: [:google_oauth2]
    )

    #The following associations allow a user to "own" or "rent" a property through
    #foreign keys in the Property class, making them a Landlord or Tenant and 
    #associating them with other Users through owned or rented properties 
    has_many :owned_properties, class_name: "Property", foreign_key: "landlord_id"
    has_many :tenants, through: :owned_properties

    has_many :rented_properties, class_name: "Property", foreign_key: "tenant_id"
    has_many :landlords, through: :rented_properties

    
    has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
    has_many :recipients, through: :sent_messages

    has_many :received_messages, class_name: "Message", foreign_key: "recipient_id"
    has_many :senders, through: :received_messages

    def self.from_omniauth(access_token)
        data = access_token.info
        user = User.where(email: data["email"]).first

        unless user
            user = User.create(
                name: data['name'],
                email: data['email'],
                password: Devise.friendly_token[0,20]
            )
        end
        user
    end

    scope :magnate, -> { User.left_joins(:owned_properties).group(:id).order("COUNT(properties.landlord_id) DESC").first }
end
