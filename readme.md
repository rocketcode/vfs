# Tiny wrapper over Net::SSH and Net::SFTP

Because they are too hard to use and have terrible API design.

    box = Rsh::Box.new host: 'webapp.com', ssh: {user: 'root', password: 'secret'}

    box.upload_directory '/my_project', '/apps/my_project'
    box.bash 'nohup /apps/my_project/server_start'
  
Honestly my wrapper also not very good. I would like to make API looks like the ['rush'][rush] gem (made by Adam Wiggins)
but it requires a lots of time, maybe I'll do it later.
So, for now it's just a small wrapper to do ssh/io operations not so painfull.

## TODO

- introduce Entity/Dir/File (the same as in Rush)
- allow to move files between any Boxes, not only between local and remote.
- add support for moving dirs.


[rush]: http://github.com/adamwiggins/rush