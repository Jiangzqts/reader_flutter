var Dz = (function() {
	var font = {
		sizeObject: {
			title: {
				small: 25,
				middle: 27,
				large: 29,
				oversize: 31
			},
			author: {
				small: 12,
				middle: 14,
				large: 16,
				oversize: 18
			},
			read: {
				small: 12,
				middle: 14,
				large: 16,
				oversize: 18
			},
			content: {
				small: 16,
				middle: 18,
				large: 20,
				oversize: 22
			},
			source: {
				small: 12,
				middle: 14,
				large: 16,
				oversize: 18
			}
		},
		rowHeight: {
			title: {
				small: 40,
				middle: 40,
				large: 44,
				oversize: 46
			},
			author: {
				small: 20,
				middle: 22,
				large: 24,
				oversize: 28
			},
			read: {
				small: 20,
				middle: 22,
				large: 26,
				oversize: 28
			},
			content: {
				small: 26,
				middle: 28,
				large: 32,
				oversize: 36
			},
			source: {
				small: 20,
				middle: 22,
				large: 26,
				oversize: 28
			}
		}
	}
	//改变字体大小
	function changeFontSize(type) {
		if(!type) return;
		document.querySelector('.dz-inner-title').style.fontSize = font.sizeObject.title[type] + 'px';
		document.querySelector('.dz-app-article-related').style.fontSize = font.sizeObject.author[type] + 'px';
		document.querySelector('.dz-app-time').style.fontSize = font.sizeObject.read[type] + 'px';
		var _container = document.querySelectorAll('.dz-app-content p');
		for(var i = 0; i < _container.length; i++) {
			_container[i].style.fontSize = font.sizeObject.content[type] + 'px';
		}
		document.querySelector('.dz-source').style.fontSize = font.sizeObject.source[type] + 'px';
		document.querySelector('.dz-inner-title').style.lineHeight = font.rowHeight.title[type] + 'px';
		document.querySelector('.dz-app-article-related').style.lineHeight = font.rowHeight.author[type] + 'px';
		document.querySelector('.dz-app-time').style.lineHeight = font.rowHeight.read[type] + 'px';
		var _containers = document.querySelectorAll('.dz-app-content p');
		for(var b = 0; b < _containers.length; b++) {
			_containers[b].style.lineHeight = font.rowHeight.content[type] + 'px';
		}
		document.querySelector('.dz-source').style.lineHeight = font.rowHeight.source[type] + 'px';
		var height = document.body.offsetHeight;
		Android.getHeight(height);
	};
	//页面加载时候替换内容
	function refreshHtmlContent(content) {
		content.title = content.title ? content.title : '';
		content.duration = content.duration ? content.duration : '';
		content.content = content.content ? content.content : '';
		content.translator = content.translator ? content.translator : '';
		content.origin = content.origin ? content.origin : '';
		content.publishTime = content.publishTime ? content.publishTime+'&nbsp;·' : '';
		content.readTime = content.readTime ? content.readTime +'&nbsp;·': '';
		content.browseCntNm = content.browseCntNm ? content.browseCntNm : '';
		content.type = content.type ? content.type : '';
		content.defaultSize = content.defaultSize ? content.defaultSize : 'middle';
		content.mediaUrl = content.mediaUrl ? content.mediaUrl : '';
		content.origin = content.origin ? content.origin : '';
		content.duration = time(content.duration * 1000);
		document.querySelector('.dz-inner-title').innerHTML = content.title;

		if(content.unscramble){

			content.author = content.author ? content.author+"&nbsp;解读" : '';
		}else{
			content.author = content.author ? content.author: '';
		}
		document.querySelector('.dz-app-article-related').innerHTML = '<span>' + content.author + '</span>';

		var _container = document.querySelector('.dz-app-content'),
			_p = _container.querySelectorAll('p');
		_container.innerHTML = content.content;
		document.querySelector('.player-title').innerHTML = content.title;
		document.querySelector('.player-totalTime').innerHTML = content.duration;
		document.querySelector('.dz-source').innerHTML = content.origin;
		document.querySelector('.dz-app-time').innerHTML = '<span>' + content.publishTime + '</span> <span>' + content.readTime + '</span> <span>' + content.browseCntNm + '</span>';
		var imgnum = $('.dz-app-content img').length;
		if(content.type) {
			if(content.type == 4) {
				document.querySelector('.dz-inner-title').style.textAlign = 'center'
				document.querySelector('.dz-app-article-related').style.textAlign = 'center'
			}
		}
		if(!content.mediaUrl) {
			document.querySelector('.dz-app-player').style.display = 'none'
		}
		if(imgnum == 0) {
			var height = document.body.offsetHeight;
			Android.getHeight(height);
		} else {
			$('.dz-app-content img').load(function() {
				if(!--imgnum) {
					var height = document.body.offsetHeight;
					Android.getHeight(height);
				}
			});
			var oImg = document.querySelectorAll('.dz-app-content img');
            var oImgLenght = document.querySelectorAll('.dz-app-content img').length;
            for (var i = 0; i < oImgLenght; i++) {
            var img = new Image();
            img.onload = img.onerror = function () {
            if (!--oImgLenght) {
           var height = document.body.offsetHeight;
           					Android.getHeight(height);
            }
            };
            img.src = oImg[i].getAttribute('src');
            }
		}
		changeFontSize(content.defaultSize)
	};
	//暂停播放方法
	function playerState() {
		$('.dz-app-player img').on('click', function() {
			var src = $('.dz-app-player img').attr('src');
			if(src.indexOf('res_icon_406') > -1) {
				$('.dz-app-player img').attr('src', 'file:///android_asset/web/img/res_icon_407.png');
				Android.play();
			} else {
				$('.dz-app-player img').attr('src', 'file:///android_asset/web/img/res_icon_406.png')
				Android.pause();

			}
		})
	};
	//动态添加方法
	function android(t) {
		//动态添加时间
		var t = time(t);
		$('.dz-app-player .player-time').html(t);
	};
	//时间计算
	function time(time) {
		var s = parseInt(time / 1000);
		var t = "";
		if(s > -1) {
			var hour = Math.floor(s / 3600);
			var min = Math.floor(s / 60) % 60;
			var sec = s % 60;
			if(hour > 0) {
				if(hour < 10) {
					t = '0' + hour + ":";
				} else {
					t = hour + ":";
				}
			}
			if(min < 10) {
				t += "0";
			}
			t += min + ":";
			if(sec < 10) {
				t += "0";
			}
			t += sec;
		}

		return t
	};
	function isPlayer(play){
	    if(play){
	       $('.dz-app-player img').attr('src', 'file:///android_asset/web/img/res_icon_407.png');
	    }else{
	        $('.dz-app-player img').attr('src', 'file:///android_asset/web/img/res_icon_406.png')
	    }
	}

	return {
		changeFontSize: changeFontSize,
		refreshHtmlContent: refreshHtmlContent,
		playerState: playerState,
		android: android,
		isPlayer: isPlayer
	}
})();
//  
// setupWebViewJavascriptBridge(function (bridge) {
//     bridge.registerHandler('changeFontSize', function (data, responseCallback) {
//         Dz.changeFontSize(data);
//         var height = document.body.offsetHeight;
//         responseCallback(height);
//     })
//     bridge.registerHandler('refreshHtmlContent', function (data, responseCallback) {
//         Dz.refreshHtmlContent(data);
//         var imgnum = $('.dz-app-content img').length;
//         if (imgnum == 0) {
//             var height = document.body.offsetHeight;
//             responseCallback(height);
//         } else {
//             $('.dz-app-content img').load(function () {
//                 if (!--imgnum) {
//                     var height = document.body.offsetHeight;
//                     responseCallback(height);
//                 }
//             });
//         }
//     })
// })