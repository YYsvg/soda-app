
// タブ切り替え・mypage
$(document).on('turbolinks:load', function() {
  $(function() {
    $('.mytab').click(function(){
      $('.mytab-active').removeClass('mytab-active');
      $(this).addClass('mytab-active');

      $('.mybox-show').removeClass('mybox-show');
      const index = $(this).index();
      $('.mytabbox').eq(index).addClass('mybox-show');
    });
  });
  });