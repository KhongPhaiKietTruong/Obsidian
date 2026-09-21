dùng để lấy nội dung trong một thẻ, bao gồm những html định dạng
```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>my website</title>
</head>

<body>
    <p id="heading1">truong anh <strong>kiet</strong></p>
    <script>
        console.log(document.getElementById("heading1").innerHTML)
    </script>
</body>

</html>
```

output
```
truong anh <strong>kiet</strong>
```

