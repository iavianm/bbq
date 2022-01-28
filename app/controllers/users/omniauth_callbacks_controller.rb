module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def vkontakte
      authenticate_user(:vkontakte)
    end

    def facebook
      authenticate_user(:facebook)
    end

    def authenticate_user(provider)
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: provider) if is_navigational_format?
      else
        flash[:error] = I18n.t(
          'devise.omniauth_callbacks.failure',
          kind: 'vkontakte',
          reason: 'authentication error'
        )
        redirect_to new_user_registration_url
      end
    end

    def failure
      redirect_to root_path
    end
  end
end
