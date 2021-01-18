class UserScript{
  static final String  CREATE_USER = ''' 
   CREATE TABLE USER(
        USER_ID  TEXT PRIMARY KEY,
        USER_NAME TEXT,
        EMAIL TEXT,
        PASSWORD TEXT,
        USER_AUTHORITY TEXT
        )
  ''';
}