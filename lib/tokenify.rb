module Tokenify
  extend ActiveSupport::Concern

  module ClassMethods
    def tokenify(**args)
      args[:field_name] = args[:field_name] || :token
      if column_names.include? args[:field_name].to_s
        set_token_callbacks args
        override_to_param(args) if args[:override_to_param]
      else
        raise "#{ self.name } does not have a column #{ args[:field_name].to_s }"
      end
    end

    def override_to_param(field_name:)
      self.public_send(:define_method, :to_param) do
        self.public_send(field_name) || super()
      end
    end

    def set_token_callbacks(field_name: :token, length: 15, padding: false, save: true)
      before_create { |object| object.create_token field_name, length, padding }
      before_save { |object| object.create_token_if_nil field_name, length, padding } if save
    end
  end

  protected
    def token_exists?(field_name, random_token)
      self.class.exists?(field_name => random_token)
    end

    def create_token(field_name, length, padding)
      self.public_send :"#{ field_name.to_s }=", generate_token(field_name, length, padding)
    end

    def create_token_if_nil(field_name, length, padding)
      create_token(field_name, length, padding) if self[field_name.to_sym].blank?
    end

    def generate_token(field_name, length, padding)
      loop do
        random_token = SecureRandom.urlsafe_base64(length, padding)
        break random_token unless token_exists?(field_name, random_token)
      end
    end
end

ActiveRecord::Base.send :include, Tokenify