class SignupController < ApplicationController

  def index
  end

  def registration
    @user = User.new
    @user.build_profile
  end

  def sms_confiemation
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new
    @user.build_profile(user_params[:profile_attributes]) 
  end

  def delivery_address
    @user = User.new
    @user.build_profile(user_params[:profile_attributes]) 
  end

  def pay_way
    @user = User.new
    @user.build_profile(user_params[:profile_attributes]) 
  end


  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
    )
    @user.build_profile(user_params[:profile_attributes]) # 入力値を引数で渡す
    @user.build_credit(user_params[:credit_attributes]) # 入力値を引数で渡す
    if @user.save
      session[:id] = @user.id
      redirect_to complete_signup_index_path
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
      credirt_attreibutes: [:id, :card_no, :validity_year, :validity_month, :security_no]
    )
  end

end
