# frozen_string_literal: true

module ApplicationHelper
  def mask_email(email)
    email.gsub(/.{5}@/, "*****@")
  end
end
