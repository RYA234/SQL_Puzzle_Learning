-- versionの監査証跡を再作成する。
SELECT chain,next,S1.file_id,stuff,suc_date
FROM portfolios AS S1, succession AS S2
WHERE S1.file_id = S2.file_id
ORDER BY chain,next
;
