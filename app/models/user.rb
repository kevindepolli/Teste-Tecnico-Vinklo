require "cpf_cnpj"
class User < ApplicationRecord
  validates :name, :phone, :email, :cpf, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with:  /\s*(\d{2}|\d{0})[-. ]?(\d{5}|\d{4})[-. ]?(\d{4})[-. ]?\s*/ }
  validate :cpf_valid?

  def cpf_valid?
    return if CPF.valid?(cpf)

    errors.add(:cpf)
  end
end
