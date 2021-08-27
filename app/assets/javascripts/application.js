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
//= require toastr
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
// きっかけはリンク以外をクリック
$(document).on('turbolinks:load', function() {
  $("#g-nav").click(function () {
      $(".openbtn").removeClass('active');
      $("#g-nav").removeClass('panelactive');
  });
});
// イベントバブリング回避
$(function(){
   $('#g-nav.ul.li').on('click', function(e){
        e.stopPropagation();
    })
})


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
$(document).on('turbolinks:load', function() {
	$(function(){
	  $('a[href^="#"]').click(function(){
	    var adjust = -40;
	    var speed = 500;
	    var href= $(this).attr("href");
	    var target = $(href == "#" || href == "" ? 'html' : href);
	    var position = target.offset().top + adjust;
	    $('body,html').animate({scrollTop:position}, speed, 'swing');
	    return false;
	  });
	});
});

//スクロールした際の動きを関数でまとめる
function PageTopAnime() {
		var scroll = $(window).scrollTop();
		if (scroll >= 300){//上から200pxスクロールしたら
			$('#page-top').removeClass('RightMove');//#page-topについているRightMoveというクラス名を除く
			$('#page-top').addClass('LeftMove');//#page-topについているLeftMoveというクラス名を付与
		}else{
			if(
				$('#page-top').hasClass('LeftMove')){//すでに#page-topにLeftMoveというクラス名がついていたら
				$('#page-top').removeClass('LeftMove');//LeftMoveというクラス名を除き
				$('#page-top').addClass('RightMove');//RightMoveというクラス名を#page-topに付与
			}
		}
}

// 画面をスクロールをしたら動かしたい場合の記述
$(window).scroll(function () {
	PageTopAnime();/* スクロールした際の動きの関数を呼ぶ*/
});

// ページが読み込まれたらすぐに動かしたい場合の記述
$(window).on('load', function () {
	PageTopAnime();/* スクロールした際の動きの関数を呼ぶ*/
});


// #page-topをボタン
$('#page-top').click(function () {
    $('body,html').animate({
        scrollTop: 0//ページトップまでスクロール
    }, 500);//ページトップスクロールの速さ。数字が大きいほど遅くなる
    return false;//リンク自体の無効化
});

/*global particlesJS*/
$(document).on('turbolinks:load', function() {
	particlesJS("particles-js", {
		"particles":{
			"number":{
				"value":7,
				"density":{
					"enable":true,
					"value_area":1121.6780303333778
				}
			},
			"color":{
				"value":"#fff"
			},
			"shape":{
				"type":"image",//形状は画像を指定
				"stroke":{
					"width":0,
				},
				"image":{
					"src":"/assets/img/icon/8.png",
					"width":200,
					"height":200
				}
			},
			"opacity":{
				"value":0.06409588744762158,
				"random":true,
				"anim":{
					"enable":false,
					"speed":1,
					"opacity_min":0.1,
					"sync":false
				}
			},
			"size":{
				"value":25,
				"random":true,//サイズをランダムに
				"anim":{
					"enable":false,
					"speed":4,
					"size_min":3,
					"sync":false
				}
			},
			"line_linked":{
				"enable":false,
			},
			"move":{
				"enable":true,
				"speed":4,//この数値を小さくするとゆっくりな動きになる
				"direction":"bottom",//右下に向かって落ちる
				"random":true,//動きはランダムにしない
				"straight":false,//動きをとどめない
				"out_mode":"out",//画面の外に出るように描写
				"bounce":true,//跳ね返りなし
				"attract":{
					"enable":false,
					"rotateX":281.9177489524316,
					"rotateY":127.670995809726
				}
			}
		},
		"interactivity":{
			"detect_on":"canvas",
			"events":{
				"onhover":{
					"enable":false,
				},
				"onclick":{
					"enable":false,
				},
				"resize":true
			}
		},
		"retina_detect":false
	});
});

// モーダルウィンドウの記述
// $(document).on('turbolinks:load', function() {
	// $(function(){
	//   $(document).on('click', '.js-open-modal', function(){
	//     $(this).next().removeClass('disable');
	//   });
	//   $('.js-close-modal').on('click', function(e){
	//     e.preventDefault();
	//     $(this).parents('.modal-panel-back').addClass('disable');
	//   });
	// });
// });
	$(function(){
	  $('.js-open-modal').on('click', function(){
	    $(this).next().removeClass('disable');
	  });
	  $('.js-close-modal').on('click', function(e){
	    e.preventDefault();
	    $(this).parents('.modal-panel-back').addClass('disable');
	  });
	});
// });
// 外枠クリックでモーダルウィンドウ消去する
$(function(){
  $('.modal-panel-back').on('click', function(){
    $(this).addClass('disable');
  })
})
// イベントバブリング防止
$(function(){
  $('.modal-panel').on('click', function(e){
    e.stopPropagation();
  })
})