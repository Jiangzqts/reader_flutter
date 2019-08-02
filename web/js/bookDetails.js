var Dz = (function () {
    //页面加载时候替换内容
    function refreshHtmlContent(content) {
        content.title = content.title ? content.title : '';
        content.cover = content.cover ? content.cover : '';
        content.introduction = content.introduction ? content.introduction : '';
        content.author = content.author ? content.author : '';
        content.duration = content.duration ? content.duration : '';
        content.content = content.content ? content.content : '';
         content.discount = content.discount ? content.discount : '';
          content.duration=time(content.duration);
        document.querySelector('.dz-lb-top h1').innerHTML = content.title;
        document.querySelector('.dz-lb-top img').src = content.cover;
        document.querySelector('.dz-lb-introduction').innerHTML = content.introduction;
        document.querySelector('.dz-lb-total .dz-lb-lf span').innerHTML = content.author;
        document.querySelector('.dz-lb-total .dz-lb-rt span').innerHTML = content.duration;
        document.querySelector('.dz-lb-bottom').innerHTML = content.content;
        if(content.discount.hasDiscount&&content.buy==0
        ){
         document.querySelector('.dz-lb-xszk').innerHTML  = '限时折扣活动时间：'+content.discount.beginDt+'至'+content.discount.endDt;
          document.querySelector('.dz-lb-xszk').style.display = 'block';
        }
        var imgnum = document.querySelectorAll('.dz-lb-top img').length;
        if (imgnum == 0) {
            var height = document.body.offsetHeight;
            Android.getHeight(height);
        } else {
            var oImg = document.querySelectorAll('.dz-lb-top img');
            var oImgLenght = document.querySelectorAll('.dz-lb-top img').length;
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
       function time(time){
         var s = time;
          var t="";
          if (s > -1) {
          var hour = Math.floor(s / 3600);
          var min = Math.floor(s / 60) % 60;
          var sec = s % 60;
          if(hour>0){
           if (hour < 10) {
            t = '0' + hour + ":";
            } else {
            t = hour + ":";
            }
          }
          if (min < 10) {
          t += "0";
          }
          t += min + ":";
          if (sec < 10) {
          t += "0";
          }
          t += sec;
          }

          return t
        }
        function isShow(){
        document.querySelector('.dz-lb-xszk').style.display = 'none';
         var height = document.body.offsetHeight;
         Android.getHeight(height);
        }
    return {
        refreshHtmlContent: refreshHtmlContent,
        isShow:isShow
    }
})();