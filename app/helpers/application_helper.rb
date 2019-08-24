module ApplicationHelper
  #手数料表示
  def saler_fee(item)
    fee = (item.price * 0.1).floor
    "¥#{fee.to_s(:delimited)}"
  end

  # 利益表示
  def saler_gain(item)
    fee = (item.price * 0.1).floor
    "¥#{(item.price - fee).to_s(:delimited)}"
  end
end