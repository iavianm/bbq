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
        set_flash_message(:notice, :success, kind: provider)
      else
        flash[:error] = I18n.t(
          'devise.omniauth_callbacks.failure',
          kind: 'provider',
          reason: 'authentication error'
        )
        redirect_to new_user_registration_url
      end
    end
  end
end
