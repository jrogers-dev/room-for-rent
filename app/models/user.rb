class User < ApplicationRecord
    has_many :owned_properties, class_name: "Property", foreign_key: "landlord_id"
    has_many :tenants, through: :owned_properties
    has_many :rented_properties, class_name: "Property", foreign_key: "tenant_id"
    has_many :landlords, through: :rented_properties
end
