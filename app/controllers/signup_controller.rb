class SignupController < ApplicationController

  before_action :save_registration_to_session, only: :sms_confirmation
  before_action :save_sms_confirmation_to_session, only: :delivery_address
  before_action :save_delivery_address_to_session, only: :pay_way
  before_action :save_pay_way_to_session, only: :create

  def index
  end


  def registration
    @user = User.new
    @user.build_profile
  end
  # validation
  def save_registration_to_session
    session[:user_params] = user_params
    session[:profile_attributes_after_registration] = user_params[:profile_attributes]
    @user = User.new(session[:user_params])
    @user.build_profile(session[:profile_attributes_after_registration])
    render '/signup/registration' unless @user.valid?
  end


  def sms_confirmation
    @user = User.new
    @user.build_profile
  end
  # validation
  def save_sms_confirmation_to_session
    session[:profile_attributes_after_sms] = user_params[:profile_attributes]
    session[:profile_attributes_after_sms].merge!(session[:profile_attributes_after_registration])
    @user = User.new
    @user.build_profile(session[:profile_attributes_after_sms])
    render '/signup/sms_confirmation' unless session[:profile_attributes_after_sms][:phone_number].present?
  end


  def delivery_address
    @user = User.new
    @user.build_profile
  end
  # validation
  def save_delivery_address_to_session
    session[:profile_attributes_after_delivery] = user_params[:profile_attributes]
    session[:profile_attributes_after_delivery].merge!(session[:profile_attributes_after_sms])
    @user = User.new
    @user.build_profile(session[:profile_attributes_after_delivery])
    render '/signup/delivery_address' unless session[:profile_attributes_after_delivery][:postal_code].present? && session[:profile_attributes_after_delivery][:prefectures].present? && session[:profile_attributes_after_delivery][:city].present? && session[:profile_attributes_after_delivery][:address1].present?
  end


  def pay_way
    @user = User.new
    @user.build_profile
    # @user.build_credit
  end
  # # validation
  # def save_pay_way_to_session
  #   @user = User.new(session[:user_params])
  #   @user.build_profile(session[:profile_attributes_after_delivery])
  #   @user.build_credit(user_params[:credit_attributes])
  #   render '/signup/pay_way' unless user_params[:credit_attributes][:card_no].present? && user_params[:credit_attributes][:validity_year].present? && user_params[:credit_attributes][:validity_month].present? && user_params[:credit_attributes][:security_no].present?
  # end



# save to DB
  def create
    @user = User.new(session[:user_params])
    @user.build_profile(session[:profile_attributes_after_delivery])
    # @user.build_credit(user_params[:credit_attributes])
    if @user.save
      session[:id] = @user.id
      redirect_to complete_signup_signup_index_path
    else
      render '/signup/registration'
    end
  end

# jump to complete
  def complete_signup
    sign_in User.find(session[:id]) unless user_signed_in?
  end


  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password, 
      :password_confirmation, 
      :card_id,
      :customer_id,
      profile_attributes: [:id, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :postal_code, :prefectures, :city, :address1, :address2, :phone_number],
      # credit_attributes: [:id, :card_no, :validity_year, :validity_month, :security_no]
    )
  end

end
