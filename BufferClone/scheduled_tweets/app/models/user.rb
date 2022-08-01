# email:string
# password_digest:string
#
# has_secure_password method rails will add the below two attributes which are virtual. we will interact only with the below and not directly with the password_digest column
# password:string virtual
# password_confirmation:string virtual
# has_secure_password will actually encrypt the provided password with bcrypt (which we installed through gemfile). this is how we create a digest and will automatically assign it in the password_digest field
# it will also make sure that the password and it's confirmation match

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Must be a valid email address.' }
end
