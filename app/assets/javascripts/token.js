$(function(){
  $(document).on('click','btn-default btn-red text-default__submit', function(e) {
    e.preventDefault();
    Payjp.setPublicKey('pk_test_d77392fe36225256e7ff799e');
    var card = {
      number: parseInt($("text-default").val()),
      cvc: parseInt($("text-default").val()),
      exp_month: parseInt($("select-default select-text-default").val()),
      exp_year: parseInt($("select-default select-text-default").val())
    };
    Payjp.createToken(card, function(status, response) {
      if (status == 200) {
        //トークン作成成功時の処理
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
        $("#card_token").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        ); //取得したトークンを送信できる状態にします
        document.inputForm.submit();
        alert("登録が完了しました"); //確認用
      }
      else {
        //トークン作成失敗時の処理
        alert("カード情報が正しくありません。"); //確認用
      }
    });
  })
})
