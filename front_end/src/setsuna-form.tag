<setsuna-from>
    <form action="/api/post" method="post">
        <div class="form-group col-sm-8">
            <label>刹那</label>
            <input id="setsuna" type="text" name="setsuna" class="form-control">
        </div>
        <div class="form-group col-sm-8">
            <label>パスワード（なしでもOK）</label>
            <input id="pass" type="password" name="pass" class="form-control">
        </div>
        <div class="form-group col-sm-8">
            <label>言語</label>
            <input id="lang" type="text" name="lang" value="jpn" class="form-control">
        </div>
        <button class="btn btn-default col-sm-6" onclick="{post_setsuna}">刹那</button>
    </form>
    <script>
        this.post_setsuna = function (e) {
            e.preventDefault()

            var data = {
                content: $('#setsuna').val(),
                password: $('#pass').val(),
                lang: $('#lang').val()
            }
            console.log(data)
            $.ajax({
                type: 'post',
                url: '/api/post/',
                data: JSON.stringify(data),
                contentType: 'application/JSON',
                dataType: 'JSON',
                scriptCharset: 'utf-8',
                success: function (data) {
                    var list = riot.mount('setsuna-list2')
                    list[0].get_setsuna()
                },
                error: function (data) {
                    alert("error")
                    console.log(data)
                }
            })
        }
    </script>
</setsuna-from>
