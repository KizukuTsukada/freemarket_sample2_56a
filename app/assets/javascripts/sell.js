$(window).on('load', function(){
  $('#sell-price').on('keyup', function(){
    var price = $(this).val();
    var saler_fee = Math.floor(price * 0.1)
    var saler_gain = price - saler_fee

    if (price >= 300 && price <= 999999) {
      $('#saler_fee').text('¥' + saler_fee.toLocaleString())
      $('#saler_gain').text('¥' + saler_gain.toLocaleString())
    } else {
      $('#saler_fee').text('-')
      $('#saler_gain').text('-')
    }
  })
});