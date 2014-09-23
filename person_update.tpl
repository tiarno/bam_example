<!doctype html>
<html>
    <head>
      <title>{{person['name']}} Stats</title>
    </head>
    <body>
      <h1>{{person['name']}} Stats</h1>
      <form name="person" method="post" action="http://example02/service/people/{{person['name']}}">
        <input type="text" name="_id" value="{{person['_id']}}" style="display: none;" />
         <table>
         <tr><th>Age</th>
          <td><input type="text" name="age" value="{{person['age']}}" /></td>
        </tr>
         <tr><th>Height</th>
          <td><input type="text" name="height" value="{{person['height']}}" /></td>
        </tr>
         <tr><th>Weight</th>
          <td><input type="text" name="weight" value="{{person['weight']}}" /></td>
        </tr>
        <tr><button type="submit">Save</button></tr>
       </table>
      </form>
    </body>
</html>