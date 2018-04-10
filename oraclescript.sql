--2. Create 2 Tablespaces (0.125)?:
    --a. first one with 2 Gb and 1 datafile, tablespace should be named "avianca"?
   
    --CREATE TABLESPACES Avianca
    CREATE TABLESPACE avianca
        DATAFILE 'D:\Project\AdminDatabase\df_avianca.dbf' SIZE 2G;
    
    --b. Undo tablespace with 25Mb of space and 1 datafile
    CREATE UNDO TABLESPACE undo_avianca
        DATAFILE 'D:\Project\AdminDatabase\df_undo_avianca.dbf' SIZE 25M;

--3. Set the undo tablespace to be used in the system (0.125) - como configurar este tablespace para utilizarlo en el system




--4. Create a DBA user (with the role DBA) and assign it to the tablespace called "avianca?", this user has
--          unlimited space on the tablespace (The user should have permission to connect) (0.125)
alter session set "_ORACLE_SCRIPT"=true;
  
    CREATE USER dba_user_avianca
        IDENTIFIED BY dba_user_avianca
        DEFAULT TABLESPACE avianca
        QUOTA UNLIMITED ON avianca;
        
    GRANT DBA, CONNECT TO dba_user_avianca;
    

--5. Create 2 profiles. (0.125)
    --a. Profile 1: "clerk" password life 40 days, one session per user, 10 minutes idle, 4 failed login
        --attempts
    CREATE PROFILE PRF_cleck LIMIT
        SESSIONS_PER_USER    1
        PASSWORD_LIFE_TIME  40
        IDLE_TIME           10
        FAILED_LOGIN_ATTEMPTS   4;


    --b. Profile 3: "development" password life 100 days, two session per user, 30 minutes idle, no
        --failed login attempts
    CREATE PROFILE PRF_development LIMIT
        SESSIONS_PER_USER    2
        PASSWORD_LIFE_TIME  100
        IDLE_TIME           30;

--6. Create 4 users, assign them the tablespace "avianca?"; 2 of them should have the clerk profile and the
--remaining the development profile, all the users should be allow to connect to the database. (0.125)
    CREATE USER clerk_user1
    IDENTIFIED BY user1
    PROFILE PRF_cleck
    DEFAULT TABLESPACE avianca;
    --
    CREATE USER clerk_user2
    IDENTIFIED BY user1
    PROFILE PRF_cleck
    DEFAULT TABLESPACE avianca;
    --   
    CREATE USER development_user1
    IDENTIFIED BY user1
    PROFILE PRF_development
    QUOTA UNLIMITED ON avianca
    ACCOUNT UNLOCK
    DEFAULT TABLESPACE avianca;
    --
    CREATE USER development_user2
    IDENTIFIED BY user1
    PROFILE PRF_development
    DEFAULT TABLESPACE avianca;
--ADICIONAR PRIVIEGIO PARA CONECTAR Y CREAR TABLAS.
    GRANT CREATE SESSION, CREATE TABLE TO development_user1;

--7. Lock one user associate with clerk profile (0.125)
    ALTER USER clerk_user2
    IDENTIFIED BY user1
    DEFAULT TABLESPACE avianca
    PROFILE PRF_cleck
    ACCOUNT LOCK;
    
    
