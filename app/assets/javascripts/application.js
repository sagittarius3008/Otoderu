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


/*global particlesJS*/

// particlesJS("particles-js", {
// 	"particles":{
// 		"number":{
// 			"value":30,//この数値を変更すると桜の数が増減できる
// 			"density":{
// 				"enable":true,
// 				"value_area":1121.6780303333778
// 			}
// 		},
// 		"color":{
// 			"value":"#fff"
// 		},
// 		"shape":{
// 			"type":"image",//形状は画像を指定
// 			"stroke":{
// 				"width":0,
// 			},
// 			"image":{
// 				"src":"images/img/icon/Cb.png",//【重要】画像を指定！桜の画像を設定してください。
// 				"width":120,
// 				"height":120
// 			}
// 		},
// 		"opacity":{
// 			"value":0.06409588744762158,
// 			"random":true,
// 			"anim":{
// 				"enable":false,
// 				"speed":1,
// 				"opacity_min":0.1,
// 				"sync":false
// 			}
// 		},
// 		"size":{
// 			"value":8.011985930952697,
// 			"random":true,//サイズをランダムに
// 			"anim":{
// 				"enable":false,
// 				"speed":4,
// 				"size_min":0.1,
// 				"sync":false
// 			}
// 		},
// 		"line_linked":{
// 			"enable":false,
// 		},
// 		"move":{
// 			"enable":true,
// 			"speed":7,//この数値を小さくするとゆっくりな動きになる
// 			"direction":"bottom-right",//右下に向かって落ちる
// 			"random":false,//動きはランダムにしない
// 			"straight":false,//動きをとどめない
// 			"out_mode":"out",//画面の外に出るように描写
// 			"bounce":false,//跳ね返りなし
// 			"attract":{
// 				"enable":false,
// 				"rotateX":281.9177489524316,
// 				"rotateY":127.670995809726
// 			}
// 		}
// 	},
// 	"interactivity":{
// 		"detect_on":"canvas",
// 		"events":{
// 			"onhover":{
// 				"enable":false,
// 			},
// 			"onclick":{
// 				"enable":false,
// 			},
// 			"resize":true
// 		}
// 	},
// 	"retina_detect":false
// });