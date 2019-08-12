class SignupController < ApplicationController

  def index
  end


  def registration
    @user = User.new
    @user.build_profile
  end

  def sms_confirmation

    session[:user_params] = user_params
    session[:profile_attributes1] = user_params[:profile_attributes]
    @user = User.new
    @user.build_profile
  end

  def delivery_address
    session[:profile_attributes2] = user_params[:profile_attributes]
    session[:profile_attributes2].merge!(session[:profile_attributes1])
    @user = User.new
    @user.build_profile
  end

  def pay_way
    session[:profile_attributes3] = user_params[:profile_attributes]
    session[:profile_attributes3].merge!(session[:profile_attributes2])
    @user = User.new
    @user.build_profile
    @user.build_credit
  end


  def create
    @user = User.new(session[:user_params])
    @user.build_profile(session[:profile_attributes3] )
    @user.build_credit(user_params[:credit_attributes])
    if @user.save
      session[:id] = @user.id
      redirect_to complete_signup_signup_index_path
    else
      render '/signup/registration'
    end
  end

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
      profile_attributes: [:id, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :postal_code, :prefectures, :city, :address1, :address2, :phone_number],
      credit_attributes: [:id, :card_no, :validity_year, :validity_month, :security_no]
    )
  end

end
