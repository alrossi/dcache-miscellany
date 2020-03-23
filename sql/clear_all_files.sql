chimera=> delete from t_dirs d where exists (select * from t_inodes n where d.ipnfsid = n.ipnfsid and n.itype = 32768);
chimera=> delete from t_inodes n where n.itype = 32768;
