<!doctype html>
<html>
    <head>
      <title>List of People</title>
    </head>
    <body>
         <h1>List of People</h1>
         <table>
            <tr><th>Name</th><th>Age</th></tr>
            %for person in results:
                <tr>
                    <td>{{person['name']}}</td>
                    <td>{{person['age']}}</td>
                </tr>
            %end for
        </table>
    </body>
</html>