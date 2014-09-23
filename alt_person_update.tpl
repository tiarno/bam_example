<!doctype html>
<head>
<title>{{person['name']}} Stats</title>
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/form2js-master/src/form2js.js"></script>
<script type="text/javascript">
        save_data = function(evt){
            var json_data = form2js('persondata', skipEmpty=false);
            var jsonstr = JSON.stringify(json_data, null, '\t');
            $.ajax({
                type:"POST",
                url: 'http://example02/service/people',
                data: jsonstr,
                success: function(){
                    alert('Configuration saved.')
                }
            });
        };
      (function($){
         $(function(){
        $('input[type=submit]').val('Submit').click(save_data);
      });
       })(jQuery);
   </script>
</head>
<body>
<h1>{{person['name']}} Stats</h1>
<form id="persondata" name="person">
  <input type="text" name="_id" value="{{person['_id']}}" style="display: none;" />
  <input type="text" name="name" value="{{person['name']}}" style="display: none;" />
  <table>
    <tr>
      <th>Age</th>
      <td><input type="text" name="age" value="{{person['age']}}" /></td>
    </tr>
    <tr>
      <th>Height</th>
      <td><input type="text" name="height" value="{{person['height']}}" /></td>
    </tr>
    <tr>
      <th>Weight</th>
      <td><input type="text" name="weight" value="{{person['weight']}}" /></td>
    </tr>
    <tr>
      <td><input type="submit" /></td>
    </tr>
  </table>
</form>
</body>
</html>