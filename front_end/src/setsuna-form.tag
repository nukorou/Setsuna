<setsuna-from>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a id="collapse-event" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                    <p class="col-md-2">つぶやく</p>
                    <input id="setsuna" type="text" name="setsuna" class="form-control"
                           placeholder="いまどうしてる？" style="text-decoration: none;">
                </a>
            </h4>
        </div>
        <div class="panel-collapse collapse" id="collapseOne">
            <form action="/api/post" method="post" class="form-horizontal">
                <div class="form-group">
                    <label class="col-md-2">パスワード</label>
                    <div class="col-md-10">
                        <input id="pass" type="password" name="pass" class="form-control">
                        <p class="help-block">なくてもOK。設定しておくと後で消しやすいです。</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2">言語</label>
                    <div class="col-md-10">
                        <input id="lang" type="text" name="lang" value="jpn" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-10 col-md-offset-2">
                        <button class="btn btn-raised btn-primary" onclick="{post_setsuna}">
                            <span class="glyphicon glyphicon-flash" aria-hidden="true"></span>
                            つぶやく
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script>
        var snackbar = require('snackbar');
        self.click_flg = true;

        this.post_setsuna = function (e) {
            e.preventDefault();

            var data = {
                content: $('#setsuna').val(),
                password: $('#pass').val(),
                lang: $('#lang').val()
            };
            console.log(data);
            $.ajax({
                type: 'post',
                url: '/api/post/',
                data: JSON.stringify(data),
                contentType: 'application/JSON',
                dataType: 'JSON',
                scriptCharset: 'utf-8',
                success: function (data) {
                    snackbar.show('つぶやきました！');
                    var list = riot.mount('setsuna-list2');
                    list[0].get_setsuna();
                    $('#collapseOne').collapse('hide');
                    $('#setsuna').val('');
                    self.click_flg = true;

                },
                error: function (data) {
                    alert("error");
                }
            })
        };
        $(function () {

            $('#collapseOne').on('shown.bs.collapse', function () {
                self.click_flg = false;
                console.log('')
                $(document).click(function (e) {
                    // クリックした場所がmenu-wrapper(領域内とみなす範囲)に無ければmenuを消す
                    if (!$.contains($('#collapseOne')[0], e.target)) {
                        $('#collapseOne').collapse('hide');
                        self.click_flg = true;
                    }
                });
            });

            //枠内クリック
            $('#collapse-event').on('click', function (e) {
                if (!self.click_flg) {
                    e.preventDefault();
                    e.stopPropagation();
                }
            });

            $('#collapseOne').on('hiden.bs.collapse', function () {
                self.click_flg = true;
            });


        });


    </script>
    <style>
        a:hover {
            text-decoration: none !important;
        }
    </style>
</setsuna-from>
