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
//= require jquery
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
/*global $*/

// ハンバーガーメニュー→navの表示のためclassを付与
$(document).on('turbolinks:load', function() {
  $('.openbtn').on('click', function(){
    $(this).toggleClass('active');
     $("#g-nav").toggleClass('panelactive');
  });
});
// nav→ハンバーガーのためclassを外す
$(document).on('turbolinks:load', function() {
  $("#g-nav a").click(function () {
      $(".openbtn").removeClass('active');
      $("#g-nav").removeClass('panelactive');
  });
});



$(document).on('turbolinks:load', function() {
	function delayScrollAnime() {
		var time = 0.2;//遅延時間を増やす秒数の値
		var value = time;
		$('.delayScroll').each(function () {
			var parent = this;					//親要素を取得
			var elemPos = $(this).offset().top;//要素の位置まで来たら
			var scroll = $(window).scrollTop();//スクロール値を取得
			var windowHeight = $(window).height();//画面の高さを取得
			var childs = $(this).children();	//子要素を取得

			if (scroll >= elemPos - windowHeight && !$(parent).hasClass("play")) {//指定領域内にスクロールが入ったらまた親要素にクラスplayがなければ
				$(childs).each(function () {
					if (!$(this).hasClass("fadeUp")) {//アニメーションのクラス名が指定されているかどうかをチェック
						$(parent).addClass("play");	//親要素にクラス名playを追加
						$(this).css("animation-delay", value + "s");//アニメーション遅延のCSS animation-delayを追加し
						$(this).addClass("fadeUp");//アニメーションのクラス名を追加
						value = value + time;//delay時間を増加させる
						//全ての処理を終わったらplayを外す
						var index = $(childs).index(this);
						if((childs.length-1) == index){
							$(parent).removeClass("play");
						}
					}
				})
			}else {
				$(childs).removeClass("fadeUp");//アニメーションのクラス名を削除
				value = time;//delay初期値の数値に戻す
			}
		})
	}
// 画面が読み込まれたらすぐに動かしたい場合の記述
	delayScrollAnime();
});



// function fadeAnime(){
// //ふわっと動くきっかけのクラス名と動きのクラス名の設定
// $('.fadeInUpTrigger').each(function(){ //fadeInUpTriggerというクラス名が
// 　　var elemPos = $(this).offset().top-50; //要素より、50px上の
// 　　var scroll = $(window).scrollTop();
// 　　var windowHeight = $(window).height();
// 　　if (scroll >= elemPos - windowHeight){
// 　　$(this).addClass('fadeIn');
// 　　// 画面内に入ったらfadeInというクラス名を追記
// 　　}else{
// 　　　$(this).removeClass('fadeIn');
// 　　// 画面外に出たらfadeInというクラス名を外す
// 　　}
// 　　});

// //関数でまとめることでこの後に違う動きを追加することが出来ます
// $('.fadeInDownTrigger').each(function(){ //fadeInDownTriggerというクラス名が
// 　　var elemPos = $(this).offset().top-50; //要素より、50px上の
// 　　var scroll = $(window).scrollTop();
// 　　var windowHeight = $(window).height();
// 　　if (scroll >= elemPos - windowHeight){
// 　　$(this).addClass('fadeDown');
// 　　// 画面内に入ったらfadeDownというクラス名を追記
// 　　}else{
// 　　　$(this).removeClass('fadeDown');
// 　　// 画面外に出たらfadeDownというクラス名を外す
// 　　}
// 　　});


// }//ここまでふわっと動くきっかけのクラス名と動きのクラス名の設定

// // 画面をスクロールをしたら動かしたい場合の記述
//   $(window).scroll(function (){
//     fadeAnime();/* アニメーション用の関数を呼ぶ*/
//   });// ここまで画面をスクロールをしたら動かしたい場合の記述