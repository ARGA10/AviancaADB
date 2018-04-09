--2. Create 2 Tablespaces (0.125)?:
    --a. first one with 2 Gb and 1 datafile, tablespace should be named "avianca"?
   
    --CREATE TABLESPACES Avianca
    CREATE TABLESPACE avianca
        DATAFILE 'D:\Project\AdminDatabase\df_avianca.dbf' SIZE 2G;
    
    --b. Undo tablespace with 25Mb of space and 1 datafile
    CREATE UNDO TABLESPACE undo_avianca
        DATAFILE 'D:\Project\AdminDatabase\df_undo_avianca.dbf' SIZE 25M;

--3. Set the undo tablespace to be used in the system (0.125) - como configurar este tablespace para utilizarlo en el system
