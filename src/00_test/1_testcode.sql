BEGIN;
SELECT plan(2);

SELECT tables_are (
        'public',
        ARRAY[
        't1'
        ]
);

SELECT * FROM finish();
ROLLBACK;