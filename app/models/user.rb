class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    #The following associations allow a user to "own" or "rent" a property through
    #foreign keys in the Property class, making them a Landlord or Tenant and 
    #associating them with other Users through owned or rented properties 
    has_many :owned_properties, class_name: "Property", foreign_key: "landlord_id"
    has_many :tenants, through: :owned_properties

    has_many :rented_properties, class_name: "Property", foreign_key: "tenant_id"
    has_many :landlords, through: :rented_properties
end
