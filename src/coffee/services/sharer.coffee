class Sharer extends Service

	constructor : ->
 
		genericUrl = document.URL

		@openWin = ( url, w, h ) =>

			left = ( screen.availWidth  - w ) >> 1
			top  = ( screen.availHeight - h ) >> 1

			window.open url, '', 'top='+top+',left='+left+',width='+w+',height='+h+',location=no,menubar=no'


		@plus = ( url ) =>

			url = encodeURIComponent( url or genericUrl )

			@openWin "https://plus.google.com/share?url=#{url}", 650, 385


		@pinterest = ( url, media, descr ) =>

			url   = encodeURIComponent( url or genericUrl )
			media = encodeURIComponent( media )
			descr = encodeURIComponent( descr )

			@openWin "http://www.pinterest.com/pin/create/button/?url=#{url}&media=#{media}&description=#{descr}", 735, 310


		@tumblr = ( url, media, descr ) =>

			url   = encodeURIComponent( url or genericUrl )
			media = encodeURIComponent( media )
			descr = encodeURIComponent( descr )

			@openWin "http://www.tumblr.com/share/photo?source=#{media}&caption=#{descr}&click_thru=#{url}", 450, 430


		@facebook = ( url , copy = '' ) => 

			url   = encodeURIComponent( url or genericUrl )
			decsr = encodeURIComponent( copy )

			@openWin "http://www.facebook.com/share.php?u=#{url}&t=#{decsr}", 600, 300


		@twitter = ( url , copy = '' ) =>

			url   = encodeURIComponent( url or genericUrl )
			if copy is ''
				copy = @__NAMESPACE__().locale.get 'seo_twitter_card_description'
				
			descr = encodeURIComponent( copy )

			@openWin "http://twitter.com/intent/tweet/?text=#{descr}&url=#{url}", 600, 300


		@renren = ( url ) => 

			url = encodeURIComponent( url or genericUrl )

			@openWin "http://share.renren.com/share/buttonshare.do?link=" + url, 600, 300


		@weibo = ( url ) => 

			url = encodeURIComponent( url or genericUrl )

			@openWin "http://service.weibo.com/share/share.php?url=#{url}&language=zh_cn", 600, 300

