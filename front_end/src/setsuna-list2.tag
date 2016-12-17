<setsuna-list2>
    <ul>
        <li each="{ setsuna in setsunas }">{ setsuna.content }:{ new Date(setsuna.limit * 1000).toLocaleString() }</li>
    </ul>
    <script>
        var self = this

        self.get_setsuna = function () {
            $.ajax({
                type: 'get',
                url: '/api/posts',
                success: function (data) {
                    console.log(data)
                    self.setsunas = JSON.parse(data)
                    self.update()
                },
                error: function (err) {
                    console.log(err)
                }
            })
        }

        self.diff = function () {
            console.log('this is diff func')
            var old_jsons = self.setsunas
            for (var j in old_jsons) {
                console.log(old_jsons[j])
            }

        }

        this.on('mount', function () {

            console.log('start')
            self.get_setsuna()
            console.log('diff')
            self.diff()

        })

    </script>

</setsuna-list2>