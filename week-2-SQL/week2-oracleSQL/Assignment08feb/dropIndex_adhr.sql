-- drop index examples

DECLARE index_count INTEGER;
BEGIN
SELECT COUNT(*) INTO index_count
    FROM USER_INDEXES
    WHERE INDEX_NAME = 'index_name';

IF index_count > 0 THEN
    EXECUTE IMMEDIATE 'DROP INDEX index_name';
END IF;
END;
/

DROP INDEX members_name_i;
