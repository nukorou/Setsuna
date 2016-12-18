<setsuna-list2>
    <ul>
        <li each="{ setsuna in setsunas }">{ setsuna.content }:{ new Date(setsuna.created_at).toLocaleString() }:{ new
            Date(setsuna.deleted_at).toLocaleString() }
        </li>
    </ul>
    <script>
        var self = this;

        self.get_setsuna = function () {
            $.ajax({
                type: 'get',
                url: '/api/posts',
                success: function (data) {
                    console.log(data);
                    self.setsunas = JSON.parse(data);
                    self.update();
                },
                error: function (err) {
                    console.log(err)
                }
            });
        };

        self.diff = function () {
            var old_jsons = self.setsunas;
            for (var j in old_jsons) {
                console.log(old_jsons[j]);
            }
        };

        this.on('mount', function () {
            self.get_setsuna();
            self.diff();

        });

    </script>

</setsuna-list2>