
var Dz = (function () {
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
        	},
        height:function(){
          AndroidtoJs.getHeight(document.documentElement.offsetHeight);
        }
    };
    function changeFontSize(type) {
        if (!type) return;
        document.querySelector('.dz-inner-title').style.fontSize = font.sizeObject.title[type] + 'px';
        document.querySelector('.dz-app-article-related').style.fontSize = font.sizeObject.author[type] + 'px';
        document.querySelector('.dz-app-read').style.fontSize = font.sizeObject.read[type] + 'px';
        var _container = document.querySelector('.dz-app-content'),
            _p = _container.querySelectorAll('p');
            for(var i=0;i<_p.length;i++){
                _p[i].style.fontSize = font.sizeObject.content[type] + 'px';
            }
        document.querySelector('.dz-source').style.fontSize = font.sizeObject.source[type] + 'px';
            document.querySelector('.dz-inner-title').style.lineHeight = font.rowHeight.title[type] + 'px';
            document.querySelector('.dz-app-article-related').style.lineHeight = font.rowHeight.author[type] + 'px';
            document.querySelector('.dz-app-read').style.lineHeight = font.rowHeight.read[type] + 'px';
            var _container = document.querySelectorAll('.dz-app-content p');
            for(var b=0;b<_container.length;b++){
             _container[b].style.lineHeight = font.rowHeight.content[type] + 'px';
            }
            document.querySelector('.dz-source').style.lineHeight = font.rowHeight.source[type] + 'px';
        font.height()
    };
function refreshHtmlContent(content) {
		content.title = content.title ? content.title : '';
		content.content = content.content ? content.content : '';
		content.author = content.author ? content.author : '';
		content.translator = content.translator ? content.translator : '';
		content.publishTime = content.publishTime ? content.publishTime+'&nbsp;·' : '';
		content.readTime = content.readTime ? content.readTime +'&nbsp;·': '';
		content.browseCntNm = content.browseCntNm ? content.browseCntNm : '';
		content.defaultSize = content.defaultSize ? content.defaultSize : 'middle';
		content.origin = content.origin ? content.origin : '';
		document.querySelector('.dz-inner-title').innerHTML = content.title;
		document.querySelector('.dz-app-article-related').innerHTML = '<span>' + content.author + '</span>';
		document.querySelector('.dz-app-read').innerHTML = '<span>' + content.publishTime + '</span><span>' + content.readTime + '</span><span>' + content.browseCntNm + '</span>';
		var _container = document.querySelector('.dz-app-content'),
			_p = _container.querySelectorAll('p');
		_container.innerHTML = content.content;
		document.querySelector('.dz-source').innerHTML = content.origin;
		var imgnum = $('.dz-app-content img').length;
		if(imgnum == 0) {
			var height = document.body.offsetHeight;
			AndroidtoJs.getHeight(height);
		} else {
			var oImg = document.querySelectorAll('.dz-app-content img');
            var oImgLenght = document.querySelectorAll('.dz-app-content img').length;
            for (var i = 0; i < oImgLenght; i++) {
            var img = new Image();
            img.onload = img.onerror = function () {
            if (!--oImgLenght) {
           var height = document.body.offsetHeight;
           		AndroidtoJs.getHeight(height);
            }
            };
            img.src = oImg[i].getAttribute('src');
            }
		}
		changeFontSize(content.defaultSize)
	};
    return {
     refreshHtmlContent:refreshHtmlContent,
      changeFontSize: changeFontSize
    }

})();




