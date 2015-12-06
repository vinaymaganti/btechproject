<html>
    <script>
var count=30;

var counter=setInterval(timer, 1000); //1000 will  run it every 1 second

function timer()
{
  count=count-1;
  if (count <= 0)
  {
     clearInterval(counter);
     //counter ended, do something here
     return;
  }
  <span id="timer"></span>

  //Do code forshowing the number of seconds here
}</script>

</html>