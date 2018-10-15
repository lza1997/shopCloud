(function($) {

    $.fn.fontFlex = function(min, max, mid) {

        var $this = this;

        $(window).resize(function() {
			var ws=window.innerWidth;
			var size=max;
			if(ws>1170)
			{
			size=max;
			}
			else if(ws>320)
			{
			size=Math.floor(ws/1170*size);
			}
			
			else{
			size=min;
			}
            if (size < min) size = min;

            $this.css('font-size', size + 'px');

        }).trigger('resize');
    };
	
	
	$.fn.paddingFlex = function(min1,min2,max1,max2) {
        var $this = this;
        $(window).resize(function() {
			var ws=window.innerWidth;
			var y=max1;
			var x=max2;
			if(ws>1170)
			{
			y=max1;
			x=max2;
			}
			else if(ws>320)
			{
			y=Math.ceil(ws/1170*max1);
			x=Math.ceil(ws/1170*max2);
			 if(y<min1)
			 {
			 y=min1;
			 x=min2;
			 }
			}
			else{
			y=min1;
			x=min2;
			}
             
            $this.css('padding',y+"px "+x+"px");

        }).trigger('resize');
    };

})(jQuery);