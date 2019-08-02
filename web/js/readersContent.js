var Dz = (function () {
    //页面加载时候替换内容
    function refreshHtmlContent(content) {
     content.isShow = content.isShow ? content.isShow : '';
     content.title = content.title ? content.title : '';
     content.content = content.content ? content.content : '';
     content.publishTime = content.publishTime ? content.publishTime+'&nbsp;·' : '';
	 content.readTime = content.readTime ? content.readTime +'&nbsp;·': '';
	 content.browseCntNm = content.browseCntNm ? content.browseCntNm : '';
	 if(content.isShow){
         document.querySelector('.dz-inner-title').innerHTML = content.title;
         document.querySelector('.dz-app-time').innerHTML = '<span>' + content.publishTime + '</span> <span>' + content.readTime + '</span> <span>' + content.browseCntNm + '</span>';
     }else{
         document.querySelector('.dz-inner-title').style.display='none';
     }
     document.querySelector('.dz-lb-content').innerHTML = content.content;
     var imgnum = $('.dz-lb-content img').length;

     if (imgnum == 0) {
           var height = document.body.offsetHeight;
           Android.getHeight(height);
     } else {
            var oImg = document.querySelectorAll('.dz-lb-content img');
            var oImgLenght = document.querySelectorAll('.dz-lb-content img').length;
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
    };
     return {
            refreshHtmlContent: refreshHtmlContent
        }
})();