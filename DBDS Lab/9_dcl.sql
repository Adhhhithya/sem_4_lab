-- 1. Grant all privileges to friend
GRANT ALL ON client_master TO aml01;

-- 2. Login as aml01 and retrieve data (Run this part separately as user aml01)
-- SELECT * FROM your_username.client_master;

-- 3. Update Basu’s Balance
BEGIN;
UPDATE your_username.client_master SET Balance = 5000 WHERE name = 'Basu';
-- Check updated data
SELECT * FROM your_username.client_master;

-- 4. Rollback the update (undo)
ROLLBACK;
-- Check if data reverted
SELECT * FROM your_username.client_master;

-- 5. Update Basu’s Balance again and commit
BEGIN;
UPDATE your_username.client_master SET Balance = 50000 WHERE name = 'Basu';
COMMIT;

-- 6. Update Ravi’s Balance and commit
BEGIN;
UPDATE your_username.client_master SET Balance = 20000 WHERE name = 'Ravi';
COMMIT;

-- 7. Update Ruk’s Balance and commit
BEGIN;
UPDATE your_username.client_master SET Balance = 16000 WHERE name = 'Ruk';
COMMIT;

-- 8. Final data check
SELECT * FROM your_username.client_master;

-- 9. Revoke privileges from friend
REVOKE ALL ON client_master FROM aml01;
