class SignupController < ApplicationController

  def index
  end

  def registration
    @user= User.new
  end

  def sms_confiemation
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user.build_profiele(user_params[:profiele_attributes]) 
    @user = User.new
  end

  def delivery_address
    session[:email] = user_params[:email]
    session[:email] = user_params[:email]
    session[:email] = user_params[:email]
    session[:email] = user_params[:email]
  end

  def pay_way
    @user.build_credit(user_params[:credit_attributes]) 
  end

  def complete_signup
    session[:email] = user_params[:email]
    session[:email] = user_params[:email]
    session[:email] = user_params[:email]
    session[:email] = user_params[:email]
  end

  def credit_attreibute
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password, 
      :password_confirmation, 
      profile_attributes: [:family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :postal_code, :prefectures, :city, :address1, :address2, :phone_number],
      credirt_attreibutes: [:card_no, :validity_year, :validity_month, :security_no]
  end

end
