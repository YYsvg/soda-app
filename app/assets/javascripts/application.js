// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require jquery3
//= require popper
//= require bootstrap-sprockets

// タブの切り替え
// turbolinksの無効化
$(document).on('turbolinks:load', function() {
$(function() {
  // .tabがクリックされたときを指定
  $('.tab').click(function(){
    // 今ある.tab-activeを削除
    $('.tab-active').removeClass('tab-active');
    // クリックされた.tabに.tab-activeを追加
    $(this).addClass('tab-active');

    // 今ある.box-showを削除
    $('.box-show').removeClass('box-show');
    
    // indexに.tabのindex番号を代入
    const index = $(this).index();
    // .tabboxとindexの番号が同じ要素に.box-showを追加
    $('.tabbox').eq(index).addClass('box-show');
    
  });
});
});

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