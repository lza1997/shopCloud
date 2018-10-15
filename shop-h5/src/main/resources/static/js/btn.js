$(document).ready(function(e){
	 $(".table .selectgroup").each(function(){
	 var i=$(this).find("input").val();
	    if(i==0)
		{
		 $(this).append('<img src="images/slide2.png" class="img-responsive" />');
		}
		else{
		 $(this).append('<img src="images/slide.png" class="img-responsive" />');
		}
	 });
	 
	 $(".table .selectgroup").click(function(){
		var i=$(this).find("input").val();
		if(i==0)
		{
		$(this).find("img").attr("src","images/slide.png");
		}
		else{
		$(this).find("img").attr("src","images/slide2.png");
		}
		 
		var k=i==1?0:1;
		$(this).find("input").val(k);
		
     });	

	  $("#test").swipe( {
        //Generic swipe handler for all directions
        swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
          //$(this).text("You swiped " + direction );  
		  var i=$(this).find("input").val();
		if(i==0)
		{
		$(this).find("img").attr("src","images/slide.png");
		}
		else{
		$(this).find("img").attr("src","images/slide2.png");
		}
		 
		var k=i==1?0:1;
		$(this).find("input").val(k);
        },
        //Default is 75px, set to 0 for demo so any distance triggers swipe
         threshold:0
      });

	 
});