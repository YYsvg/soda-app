// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
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

    // タブが選択された時の特定の処理を追加する
    // @outcomename がタブで選択された場合の条件分岐
    let tabName = $(this).data('tab-name'); // タブのデータ属性を取得
  });
});

// =========

$(document).ready(function() {
  // タブメニュー要素を取得
  const tabMenus = $('.tab__menu-item');

  // クリックイベントを設定
  tabMenus.on('click', function() {
    const clickedTab = $(this);
    const tabTargetData = clickedTab.data('tab');
    const tabList = clickedTab.closest('.tab__menu');
    const tabItems = tabList.find('.tab__menu-item');
    const tabPanelItems = tabList.next('.tab__panel').find('.tab__panel-box');

    // 全てのタブからクラスを削除
    tabItems.removeClass('is-active');
    tabPanelItems.removeClass('is-show');

    // クリックされたタブにクラスを追加
    clickedTab.addClass('is-active');

    // 対応するパネルにクラスを追加
    tabPanelItems.each(function() {
      if ($(this).data('panel') === tabTargetData) {
        $(this).addClass('is-show');
      }
    });
  });
});