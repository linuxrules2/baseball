CREATE OR REPLACE TRIGGER MLB_PLAYER_PROFILES_TRG 
BEFORE INSERT ON MLB_PLAYER_PROFILES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.PLAYER_PROFILE_ID IS NULL THEN
      SELECT MLB_PK_SEQ.NEXTVAL INTO :NEW.PLAYER_PROFILE_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
